package pl.coderslab.charity.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import pl.coderslab.charity.entity.Donation;
import pl.coderslab.charity.repository.CategoryRepository;
import pl.coderslab.charity.repository.DonationRepository;
import pl.coderslab.charity.repository.InstitutionRepository;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
@SessionAttributes("donation")
public class DonationController {
    private final CategoryRepository categoryRepository;
    private final DonationRepository donationRepository;
    private final InstitutionRepository institutionRepository;

    public DonationController(CategoryRepository categoryRepository, DonationRepository donationRepository, InstitutionRepository institutionRepository) {
        this.categoryRepository = categoryRepository;
        this.donationRepository = donationRepository;
        this.institutionRepository = institutionRepository;

    }

    @ModelAttribute("donation")
    public Donation donation(){
        return new Donation();
    }

    @RequestMapping("/form")
    public String showForm(Model model) {
        model.addAttribute("categories", categoryRepository.findAll());
        model.addAttribute("institutions",institutionRepository.findAll());
        model.addAttribute("donation", new Donation());
        return "form";
    }

    @RequestMapping(value = "/form", method = RequestMethod.POST)
    public String showDonation(Model model, @Valid Donation donation, BindingResult result, RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
            model.addAttribute("categories", categoryRepository.findAll());
            model.addAttribute("institutions", institutionRepository.findAll());
            return "form";
        }
        model.addAttribute("donation", donation);
//        donationRepository.save(donation);
        return "formConfirmation";
    }
    @PostMapping("/conf")
    public String saveDonation(HttpSession session){
        donationRepository.save((Donation) session.getAttribute("donation"));
        session.removeAttribute("donation");
        return "formThx";

    }
}
