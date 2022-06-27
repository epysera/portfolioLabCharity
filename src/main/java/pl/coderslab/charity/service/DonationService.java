package pl.coderslab.charity.service;

import org.springframework.stereotype.Service;
import pl.coderslab.charity.repository.DonationRepository;

import java.util.stream.Collectors;

@Service
public class DonationService {
    private final DonationRepository donationRepository;

    public DonationService(DonationRepository donationRepository) {
        this.donationRepository = donationRepository;
    }

    public Long sumOfBags() {
        return donationRepository.findAll().stream()
                .map(donation -> donation.getQuantity())
                .collect(Collectors.toList())
                .stream().mapToLong(num -> num.longValue())
                .sum();

    }
}
