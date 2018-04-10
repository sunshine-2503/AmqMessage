package com.lzq.servlet;

import org.apache.activemq.web.AjaxServlet;
import org.springframework.boot.web.servlet.ServletContextInitializer;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 */
@Configuration
public class ServletBean {

    @Bean
    public ServletRegistrationBean amqServletRegistrationBean() {
        ServletRegistrationBean registrationBean = new ServletRegistrationBean();
        registrationBean.setServlet(new AjaxServlet());
        registrationBean.setLoadOnStartup(1);
        List<String> urlMappings=new ArrayList<>();
        urlMappings.add("/amq/*");
        registrationBean.setUrlMappings(urlMappings);
        return registrationBean;
    }

    @Bean
    public ServletContextInitializer initializer() {
        return servletContext -> servletContext.setInitParameter("org.apache.activemq.brokerURL", "tcp://127.0.0.1:61616");
    }
}
