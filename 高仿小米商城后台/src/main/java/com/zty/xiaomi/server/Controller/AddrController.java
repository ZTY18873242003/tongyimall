package com.zty.xiaomi.server.Controller;

import com.zty.xiaomi.server.Entity.Address.AddrResult;
import com.zty.xiaomi.server.Entity.Address.AddrSuccResult;
import com.zty.xiaomi.server.Entity.Address.Addre;
import com.zty.xiaomi.server.Entity.User;
import com.zty.xiaomi.server.Service.Address.AddServiceImp;
import com.zty.xiaomi.server.Service.RegLogin.RegLogServiceImp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;

@CrossOrigin
@RestController
@RequestMapping("shippings")
public class AddrController {
    @Autowired
    private RegLogServiceImp regLogServiceImp;
    @Autowired
    private AddServiceImp addServiceImp;

    @PostMapping("/push")
    public AddrSuccResult pushSucc(@RequestBody Addre a) throws IOException {
        User userByUserName = regLogServiceImp.getUserByUserName(a.getUsername());
        a.setUserid(userByUserName.getUserid());
        AddrSuccResult addrSuccResult = addServiceImp.inseAddre(a);
        return addrSuccResult;
    }

    @RequestMapping("/getAll")
    public AddrResult getAll(@RequestParam("username") String username) throws IOException {
        User userByUserName = regLogServiceImp.getUserByUserName(username);
        String userid = userByUserName.getUserid();
        AddrResult addrResult = addServiceImp.getAll(userid);
        return addrResult;
    }

    @PutMapping("{id}")
    public AddrSuccResult updatAddre(@PathVariable("id") int id,@RequestBody Addre a) throws IOException {
        User userByUserName = regLogServiceImp.getUserByUserName(a.getUsername());
        a.setUserid(userByUserName.getUserid());
        a.setId(id);
        AddrSuccResult addrSuccResult = addServiceImp.updaAddre(a);
        return addrSuccResult;
    }
    @DeleteMapping("{id}")
    public AddrSuccResult deletAddre(@PathVariable("id") int id) throws IOException {
        AddrSuccResult addrSuccResult = addServiceImp.deleAddre(id);
        return addrSuccResult;
    }
}
