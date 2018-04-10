package com.lzq.jms;

import org.apache.activemq.command.ActiveMQQueue;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.jms.Destination;

/**
 *
 */
@Service
public class Producer {
    private static final String AMQ_DESTINATION = "amq.test";

    @Resource
    private JmsTemplate jmsTemplate;

    public void sendMessage(Destination destination, String message) {
        jmsTemplate.convertAndSend(destination, message);
    }

    public void sendMessage(String message) {
        Destination destination = new ActiveMQQueue(AMQ_DESTINATION);
        jmsTemplate.convertAndSend(destination, message);
    }

}
