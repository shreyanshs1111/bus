package org.antwalk.repository;

import org.antwalk.entity.ArrivalTimeTable;
import org.antwalk.entity.Route;
import org.antwalk.entity.RouteAndStop;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ArrivalTimeRepo extends JpaRepository<ArrivalTimeTable, RouteAndStop>{

}
