package com.lzq.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 */
@Controller
public class MessageController {

    @RequestMapping("/send")
    public String send() {
        return "send";
    }

    @RequestMapping("/receive")
    public String receive() {
        return "receive";
    }

}
