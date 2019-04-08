package soft.transport.management.repository;


import org.springframework.data.jpa.repository.JpaRepository;


import soft.transport.management.model.TransportRequisition;

public interface TransportRequisitionRepository extends JpaRepository<TransportRequisition, Integer>{
	
	/*@Query("select * from transportrequisition tr where tr.status = 'R'")
	List<TransportRequisition> findRequisitionRejectedList(@Param("status") String status);*/

}
