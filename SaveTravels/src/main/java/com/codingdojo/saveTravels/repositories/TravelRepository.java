package com.codingdojo.saveTravels.repositories;

import java.util.ArrayList;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.saveTravels.models.Travel;

@Repository
public interface TravelRepository extends CrudRepository <Travel, Long> {
	ArrayList<Travel> findAll();
}
