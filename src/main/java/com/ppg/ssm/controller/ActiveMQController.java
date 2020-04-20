package com.ppg.ssm.controller;

import org.apache.activemq.command.ActiveMQQueue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@RestController
@RequestMapping("mq")
public class ActiveMQController {

    @Resource(name = "jmsTemplateTopic")
    private JmsTemplate jmsTemplateTopic;

    @Resource(name = "jmsTemplateQueue")
    private JmsTemplate jmsTemplateQueue;


    @RequestMapping("sendQueue")
    public void sendMessageQueue(String message){
        jmsTemplateQueue.convertAndSend(message);
    }
    @RequestMapping("sendTopic")
    public void sendMessageTopic(String message){
        jmsTemplateTopic.convertAndSend(message);
    }
}
