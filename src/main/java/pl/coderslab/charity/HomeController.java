package pl.coderslab.charity;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pl.coderslab.charity.entity.Institution;
import pl.coderslab.charity.repository.CategoryRepository;
import pl.coderslab.charity.repository.DonationRepository;
import pl.coderslab.charity.repository.InstitutionRepository;
import pl.coderslab.charity.service.DonationService;

import java.util.List;


@Controller
public class HomeController {

    private final InstitutionRepository institutionRepository;
    private final CategoryRepository categoryRepository;
    private final DonationRepository donationRepository;
    private final DonationService donationService;

    public HomeController(InstitutionRepository institutionRepository, CategoryRepository categoryRepository, DonationRepository donationRepository, DonationService donationService) {
        this.institutionRepository = institutionRepository;
        this.categoryRepository = categoryRepository;
        this.donationRepository = donationRepository;
        this.donationService = donationService;
    }


    @RequestMapping("/")
    public String homeAction(Model model){
        return "index";
    }

    @GetMapping("/")
    public String showAll(Model model) {
        List<Institution> institutions = institutionRepository.findAll();
        model.addAttribute("institutions", institutions);
        model.addAttribute("donationsQuantity", donationRepository.findAll().size());
        model.addAttribute("sumOfBags",donationService.sumOfBags());
        return "index";
    }



    @GetMapping("/about")
    @ResponseBody
    public String respBody() {
        return "Surowy tekst portfolioLab";
    }

}
