package soft.transport.management.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

@Entity
@JsonIdentityInfo(generator = ObjectIdGenerators.IntSequenceGenerator.class, property = "id")
@Table(name="driverinformation")
public class Driver {
	
    
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private Integer id;
	
	@Transient
	private Integer tmpId;
	
	@Column(name = "name")
	private String driverName;
	
	@Column(name = "driverCode")
	private String driverCode;
	
	@Column(name = "dob")
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
	private Date   driverDateOfBirth;
	
	@Column(name = "drivingLicense")
	private String drivingLicense;
	
	@Column(name = "licenseExpireDate")
	private Date licenseExpireDate;
	
	@Column(name = "nid")
	private String driverNid;
	
	@Column(name = "presentAddress")
	private String presentAddress;
	
	@Column(name = "parmanentAddress")
	private String parmanentAddress;
	
	@Column(name = "contactNO")
	private String driverContactNO;
	
	@Column(name = "email")
	private String driverEmail;
	
	@Column(name = "photo")
	private String driverImage;
	
	public Driver() {
		
	}

	public Driver(Integer id, String driverName, String driverCode, Date driverDateOfBirth, String drivingLicense,
			Date licenseExpireDate, String driverNid, String presentAddress, String parmanentAddress,
			String driverContactNO, String driverEmail, String driverImage) {
		//super();
		this.id = id;
		this.driverName = driverName;
		this.driverCode = driverCode;
		this.driverDateOfBirth = driverDateOfBirth;
		this.drivingLicense = drivingLicense;
		this.licenseExpireDate = licenseExpireDate;
		this.driverNid = driverNid;
		this.presentAddress = presentAddress;
		this.parmanentAddress = parmanentAddress;
		this.driverContactNO = driverContactNO;
		this.driverEmail = driverEmail;
		this.driverImage = driverImage;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
	
	
	public Integer getTmpId() {
		return tmpId;
	}

	public void setTmpId(Integer tmpId) {
		this.tmpId = tmpId;
	}

	public String getDriverName() {
		return driverName;
	}

	public void setDriverName(String driverName) {
		this.driverName = driverName;
	}

	public String getDriverCode() {
		return driverCode;
	}

	public void setDriverCode(String driverCode) {
		this.driverCode = driverCode;
	}

	public Date getDriverDateOfBirth() {
		return driverDateOfBirth;
	}

	public void setDriverDateOfBirth(Date driverDateOfBirth) {
		this.driverDateOfBirth = driverDateOfBirth;
	}

	public String getDrivingLicense() {
		return drivingLicense;
	}

	public void setDrivingLicense(String drivingLicense) {
		this.drivingLicense = drivingLicense;
	}

	public Date getLicenseExpireDate() {
		return licenseExpireDate;
	}

	public void setLicenseExpireDate(Date licenseExpireDate) {
		this.licenseExpireDate = licenseExpireDate;
	}

	public String getDriverNid() {
		return driverNid;
	}

	public void setDriverNid(String driverNid) {
		this.driverNid = driverNid;
	}

	public String getPresentAddress() {
		return presentAddress;
	}

	public void setPresentAddress(String presentAddress) {
		this.presentAddress = presentAddress;
	}

	public String getParmanentAddress() {
		return parmanentAddress;
	}

	public void setParmanentAddress(String parmanentAddress) {
		this.parmanentAddress = parmanentAddress;
	}

	public String getDriverContactNO() {
		return driverContactNO;
	}

	public void setDriverContactNO(String driverContactNO) {
		this.driverContactNO = driverContactNO;
	}

	public String getDriverEmail() {
		return driverEmail;
	}

	public void setDriverEmail(String driverEmail) {
		this.driverEmail = driverEmail;
	}

	public String getDriverImage() {
		return driverImage;
	}

	public void setDriverImage(String driverImage) {
		this.driverImage = driverImage;
	}
	
	@Override
	public String toString() {
		return "Driver [id=" + id + ", driver Name=" + driverName + ", Driver Code="+driverCode+", Date of birth="+driverDateOfBirth+""
				+ ", Driving License="+drivingLicense+",licenseExpireDate="+licenseExpireDate+",Driver NID="+driverNid+", presentAddress="+presentAddress+""
						+ " , parmanentAddress="+parmanentAddress+",driverContactNO="+driverContactNO+",driverEmail="+driverEmail+","
								+ "Driver Image="+driverImage+" ]";
	}
	

}
