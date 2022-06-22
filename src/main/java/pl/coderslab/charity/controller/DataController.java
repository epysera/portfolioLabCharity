package pl.coderslab.charity.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import pl.coderslab.charity.entity.Category;
import pl.coderslab.charity.entity.Donation;
import pl.coderslab.charity.entity.Institution;
import pl.coderslab.charity.repository.CategoryRepository;
import pl.coderslab.charity.repository.DonationRepository;
import pl.coderslab.charity.repository.InstitutionRepository;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

@Controller
public class DataController {

    private final CategoryRepository categoryRepository;
    private final InstitutionRepository institutionRepository;
    private final DonationRepository donationRepository;

    public DataController(CategoryRepository categoryRepository, InstitutionRepository institutionRepository, DonationRepository donationRepository) {
        this.categoryRepository = categoryRepository;
        this.institutionRepository = institutionRepository;
        this.donationRepository = donationRepository;
    }

    @GetMapping("/data")
    public String uploadData() {
        Category zabawki = new Category(1L,"zabawki");
        categoryRepository.save(zabawki);
        Category ubrania = new Category(2L,"ubrania");
        categoryRepository.save(ubrania);
        Category sprzetAGD = new Category(3L, "sprzęt AGD");
        categoryRepository.save(sprzetAGD);

        Institution lodz = new Institution(1L, "Dom Dziecka w Łodzi","opis 1");
        institutionRepository.save(lodz);
        Institution wroclaw = new Institution(2L, "Fundacja Wro", "opis 2 wro");
        institutionRepository.save(wroclaw);
        Institution wwa = new Institution(3L, "Fundacja Kido WWA", "opis 3 wwa");
        institutionRepository.save(wwa);

        Donation don1 = new Donation(1L, 3, "Kaliska 44","Łódź","91-104", LocalDate.of(2022,06,30), LocalTime.of(17,0,0),"zabawki do odbioru", List.of(zabawki),lodz);
        donationRepository.save(don1);
        Donation don2 = new Donation(2L, 6, "Plantowa 4","Wrocław","71-100", LocalDate.of(2022,06,29), LocalTime.of(13,0,0),"ubrania do odbioru", List.of(ubrania),wroclaw);
        donationRepository.save(don2);
        Donation don3 = new Donation(3L, 2, "Sienkiewicza 88","Wrocław","71-111", LocalDate.of(2022,06,27), LocalTime.of(9,0,0),"sprzęt do odbioru", List.of(sprzetAGD),wroclaw);
        donationRepository.save(don3);
        Donation don4 = new Donation(4L, 5, "Mickiewicza 77","Warszawa","22-333", LocalDate.of(2022,06,28), LocalTime.of(9,0,0),"dptacje do odbioru", List.of(sprzetAGD, zabawki),wwa);
        donationRepository.save(don4);


        return "Dane zostały wgrane";
    }

}
