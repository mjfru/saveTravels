package com.codingdojo.saveTravels.services;

import java.util.ArrayList;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.codingdojo.saveTravels.models.Travel;
import com.codingdojo.saveTravels.repositories.TravelRepository;

@Service
public class TravelService {
	private final TravelRepository travelRepository;
	
	public TravelService(TravelRepository travelRepository) {
		this.travelRepository = travelRepository;
	}
	
	// Create
	public Travel createTravel(Travel travel) {
		return travelRepository.save(travel);
	}
	
	// Read All
	public ArrayList<Travel> getAllTravels() {
		return travelRepository.findAll();
	}
	
	// Read One
	public Travel findTravel(Long id) {
		Optional<Travel> optionalTravel = travelRepository.findById(id);
		if (optionalTravel.isPresent()) {
			return optionalTravel.get();
		} else {
			return null;
		}
	}
	
	// Update
	public Travel updateTravel(Travel travel) {
		return travelRepository.save(travel);
	}
	
	// Delete
	public void deleteTravel(Long id) {
		travelRepository.deleteById(id);
	}
}
