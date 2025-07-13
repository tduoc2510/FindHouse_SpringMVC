/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controllers.service;

import controllers.repository.TenantRepository;
import java.util.Date;
import java.util.List;
import model.entity.Tenant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Thanh Duoc
 */
@Service
public class TenantService {

    @Autowired
    private TenantRepository tenantRepository;

    public Tenant saveTenant(Tenant tenant) {
        return tenantRepository.save(tenant);
    }

    public List<Tenant> getTenantsByUserId(int userId) {
        return tenantRepository.findByUserId(userId);
    }
    public List<Tenant> getActiveTenants() {
        return tenantRepository.findActiveTenants();
    }

    public List<Tenant> getTenantsFromDate(Date date) {
        return tenantRepository.findTenantsFromDate(date);
    }

}
