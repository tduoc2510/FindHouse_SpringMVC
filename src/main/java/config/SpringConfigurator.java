/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package config;

/**
 * SpringConfigurator - Mô tả lớp (hoặc giao diện).
 * <p>
 * Tác giả: Thanh Duoc</br>
 * Ngày sinh: 25/10/2003</br>
 * Ngày tạo: Dec 9, 2024
 */
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.WebApplicationContext;
import javax.websocket.server.ServerEndpointConfig.Configurator;

public class SpringConfigurator extends Configurator {
    @Autowired
    private WebApplicationContext springContext;

    @Override
    public <T> T getEndpointInstance(Class<T> endpointClass) throws InstantiationException {
        // Tiêm bean vào WebSocket endpoint
        return springContext.getAutowireCapableBeanFactory().createBean(endpointClass);
    }
}
