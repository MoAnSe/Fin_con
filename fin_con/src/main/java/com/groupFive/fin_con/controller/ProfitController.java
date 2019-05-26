package com.groupFive.fin_con.controller;

import com.groupFive.fin_con.domain.Profit;
import com.groupFive.fin_con.domain.User;
import com.groupFive.fin_con.repo.ProfitRepo;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.List;

@RestController
@RequestMapping("profit")
public class ProfitController {
    private final ProfitRepo profitRepo;
//    @Autowired
//    JdbcTemplate jdbcTemplate;
//    public Integer balance(){
//        Profit profit = new Profit();
//        int pamount = jdbcTemplate.queryForObject("select sum(profit.p_amount) from profit;", Integer.class);
//        int lamount = jdbcTemplate.queryForObject("select sum(loss.l_amount) from loss;", Integer.class);
//        Integer amount = pamount-lamount;
//        return profit.setAmount(amount);
//    }


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

