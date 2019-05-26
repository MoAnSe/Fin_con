package com.groupFive.fin_con.controller;

import com.groupFive.fin_con.domain.User;
import com.groupFive.fin_con.repo.LossRepo;
import com.groupFive.fin_con.repo.ProfitRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.HashMap;

@Controller
@RequestMapping("/")
public class MainController {

    private final ProfitRepo profitRepo;
    private final LossRepo lossRepo;


    @Autowired
    public MainController(ProfitRepo profitRepo, LossRepo lossRepo) {
        this.profitRepo = profitRepo;
        this.lossRepo = lossRepo;
    }

    @GetMapping
    public String main(Model model, @AuthenticationPrincipal User user) {
        HashMap<Object, Object> data = new HashMap<>();

        data.put("profile", user);
        try {
            data.put("vprofit", profitRepo.findByUserId(user.getId()));
            data.put("vloss", lossRepo.findByUserId(user.getId()));
        } catch (NullPointerException e) {
            data.put("vprofit", profitRepo.findAll());
            data.put("vloss", lossRepo.findAll());
        }

        model.addAttribute("frontendData", data);

        return "index";
    }
}
