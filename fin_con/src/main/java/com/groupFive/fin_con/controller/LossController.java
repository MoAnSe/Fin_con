package com.groupFive.fin_con.controller;

import com.groupFive.fin_con.domain.Loss;
import com.groupFive.fin_con.domain.Profit;
import com.groupFive.fin_con.domain.User;
import com.groupFive.fin_con.repo.LossRepo;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.List;

@RestController
@RequestMapping("loss")
public class LossController {

    private final LossRepo lossRepo;

    @Autowired
    public LossController(LossRepo lossRepo) {
        this.lossRepo = lossRepo;
    }

    @GetMapping
    public List<Loss> list(@AuthenticationPrincipal User user){

        return  lossRepo.findByUserId(user.getId());
    }

    @PostMapping
    public Loss create(@RequestBody Loss message, @AuthenticationPrincipal User user){
        message.setCreationDate(LocalDateTime.now());
        message.setUserId(user.getId());
        return lossRepo.save(message);
    }
    @PutMapping("{id}")
    public Loss update(
            @PathVariable("id") Loss messageFromDb,
            @RequestBody Loss message){
        BeanUtils.copyProperties(message, messageFromDb,"id" );
        return lossRepo.save(messageFromDb);
    }
    @DeleteMapping("{id}")
    public void delete(@PathVariable("id") Loss message) {
        lossRepo.delete(message);
    }
}


