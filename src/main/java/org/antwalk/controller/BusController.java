package org.antwalk.controller;

import java.util.List;

import org.antwalk.entity.Bus;
import org.antwalk.entity.Route;
import org.antwalk.repository.BusRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/bus")
public class BusController {
	
	@Autowired
	BusRepo busRepo;
	
	@PostMapping("/insert")
	public Bus insert(@RequestBody Bus b) {
		return busRepo.save(b);
	}
	
	@GetMapping("/getall")
	public List<Bus> getAll(){
		return busRepo.findAll();
	}
	
	@GetMapping("/getbyid/{id}")
	public Bus getById(@PathVariable long id) {
		return busRepo.findById(id).get();
	}
	
	@DeleteMapping("/deletebyid/{id}")
	public String deleteById(@PathVariable long id) {
		busRepo.deleteById(id);
		return "Deleted";
	}
	
	@PutMapping("/update/{id}")
	public String update(@RequestBody Bus b, @PathVariable long id) {
		List<Bus> busList = busRepo.findAll();
		for(Bus obj:busList) {
			if(obj.getBid() == id) {
				if(b.getBid() == id) {
					busRepo.save(b);
					return "Updated";
				}
				
				else {
					return "Id doesn't match";
				}
				
			}
		}
		return "Id does not exist";
		
	}
}
