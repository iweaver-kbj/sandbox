package com.example.springsimple.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

@RestController
public class DemoController {

    private static Logger LOG = LoggerFactory.getLogger(DemoController.class);

    @GetMapping("/api/v1/jupyter-hub")
    public String getFibonacciSeriesBelowGivenInteger2(@RequestParam Map<String, String> params) {
        String inputString = params.get("input");
        LOG.info("인풋 input: {}", inputString);

        int input = Integer.valueOf(inputString);
        String result = "jupyter-hub";

        return result;
    }
}
