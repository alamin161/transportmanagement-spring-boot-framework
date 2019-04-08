package soft.transport.management.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import soft.transport.management.model.TransportInformation;
import soft.transport.management.service.TransportInformationService;

@Controller
public class TransportInformationController {
	
	@Autowired
	TransportInformationService transportInformationService;
	
	@RequestMapping(value="/transportinformation")
	public String showTransportInformation()
	{
		return "transportinformation";
	}
	
	@RequestMapping(value="/saveTransportInformation", method = RequestMethod.POST)
	public @ResponseBody  String saveTransportinformation(@RequestBody TransportInformation transportInformation, Principal principal) {
		transportInformation.setCreatedBy(Long.parseLong(principal.getName()));
		transportInformationService.add(transportInformation);
		return "Successfully Saved";
	}
	
	@RequestMapping(value="/viewAllTransportInformation"/*, method = RequestMethod.POST*/ )
	public @ResponseBody List<TransportInformation> viewAllTransportInformation(){
		
		return transportInformationService.showAllTransportInformation();
	}
	
	@RequestMapping(value="/viewTransportInformationByFkTransportType", method = RequestMethod.POST)
	public @ResponseBody List<TransportInformation> viewTransportInformationByFkTransportType(@RequestParam("transportTypeId") int transportTypeId) {
		
		return transportInformationService.findTransportInformationByFkTransportType(transportTypeId);
	}

}
