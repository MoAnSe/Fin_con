package com.groupFive.fin_con.controller;

import com.groupFive.fin_con.domain.Profit;
import com.groupFive.fin_con.domain.User;
import com.groupFive.fin_con.repo.ProfitRepo;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.List;

@RestController
@RequestMapping("profit")
public class ProfitController {
    private final ProfitRepo profitRepo;

    @Autowired
    JdbcTemplate jdbcTemplate;
    @GetMapping("/amo")
    public int balance(@AuthenticationPrincipal User user){
        int pamount;
        int lamount;
        String i = user.getId();
        try{
            int l = jdbcTemplate.queryForObject("select sum(loss.l_amount) from loss\n" +
                    "join usr on usr.id = loss.user_id\n" +
                    "where usr.id = ?;", Integer.class, i);
            lamount = l;

        }catch(NullPointerException e){
            lamount = 0;
        }
        try{
            int p = jdbcTemplate.queryForObject("select sum(profit.p_amount) from profit\n" +
                    "join usr on usr.id = profit.user_id\n" +
                    "where usr.id = ?;", Integer.class, i);
            pamount = p;

        }catch(NullPointerException e){
            pamount = 0;
        }

        int amount = pamount-lamount;
        if(pamount <= 0  && lamount <= 0){
            return 0;
        }else {
            if(lamount <= 0){
                return pamount;
            }

            return amount;
        }

    }


    @Autowired
    public ProfitController(ProfitRepo profitRepo) {
        this.profitRepo = profitRepo;
    }

    @GetMapping
    public List<Profit> list(@AuthenticationPrincipal User user){

        return  profitRepo.findByUserId(user.getId());
    }

    @PostMapping
    public Profit create(@RequestBody Profit message, @AuthenticationPrincipal User user){
        message.setCreationDate(LocalDateTime.now());
        message.setUserId(user.getId());
        return profitRepo.save(message);
    }
    @PutMapping("{id}")
    public Profit update(
            @PathVariable("id") Profit messageFromDb,
            @RequestBody Profit message){
        BeanUtils.copyProperties(message, messageFromDb,"id" );
        return profitRepo.save(messageFromDb);
    }
    @DeleteMapping("{id}")
    public void delete(@PathVariable("id") Profit message) {
        profitRepo.delete(message);
    }
}

