/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package config;



import java.util.List;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.handler.SimpleMappingExceptionResolver;

@EnableWebMvc
@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/assets/img/**")
                .addResourceLocations("file:///D:/code/NetBean/7Job-SpringMVC/src/main/webapp/assets/img/");
    }

    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        // Tùy chỉnh các view controller nếu cần thiết (điều hướng mà không cần
        // controller)
        registry.addViewController("/home").setViewName("home");
    }

    @Override
    public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
        // Cho phép xử lý các tài nguyên tĩnh (CSS, JavaScript, images) bởi servlet mặc
        // định của Tomcat
        configurer.enable();
    }

    @Override
    public void configureMessageConverters(List<HttpMessageConverter<?>> converters) {
        // Cấu hình converters nếu bạn cần chuyển đổi các định dạng như JSON, XML
        // Example: converters.add(new MappingJackson2HttpMessageConverter());
    }

    @Override
    public void addArgumentResolvers(List<HandlerMethodArgumentResolver> argumentResolvers) {
        // Cấu hình custom argument resolver nếu cần
    }

    @Override
    public void configureHandlerExceptionResolvers(List<HandlerExceptionResolver> exceptionResolvers) {
        // Cấu hình xử lý ngoại lệ toàn cục (ví dụ: xử lý EntityNotFoundException)
        exceptionResolvers.add(new SimpleMappingExceptionResolver());
    }

}
