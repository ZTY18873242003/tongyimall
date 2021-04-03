package com.zty.xiaomi.server.Service.Address;

import com.zty.xiaomi.server.Entity.Address.AddrResult;
import com.zty.xiaomi.server.Entity.Address.AddrSuccResult;
import com.zty.xiaomi.server.Entity.Address.Addre;
import com.zty.xiaomi.server.Entity.Address.AddreList;
import com.zty.xiaomi.server.Mapper.Address;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AddServiceImp implements AddService {

    @Autowired
    private Address addressmapper;

    @Override
    public AddrSuccResult inseAddre(Addre addre) {
        AddrSuccResult addrSuccResult = new AddrSuccResult();
        addrSuccResult.setStatus(0);
        addrSuccResult.setMsg("新建地址成功");
        addressmapper.inseAddre(addre.getUserid(),addre.getReceiverName(),addre.getReceiverMobile(),addre.getReceiverProvince(),addre.getReceiverCity(),addre.getReceiverAddress(),addre.getReceiverZip());
        return addrSuccResult;
    }

    @Override
    public AddrResult getAll(String userid) {
        AddrResult addrResult = new AddrResult();
        addrResult.setStatus(0);
        AddreList addreList = new AddreList();
        List<Addre> addres = addressmapper.getAll(userid);
        if (addres == null)
            addreList.setTotal(0);
        else {
            addreList.setTotal(addres.toArray().length);
            addreList.setAddreList(addres);
        }
        addrResult.setData(addreList);
        return addrResult;
    }

    @Override
    public AddrSuccResult updaAddre(Addre addre){
        AddrSuccResult addrSuccResult = new AddrSuccResult();
        addrSuccResult.setStatus(0);
        addrSuccResult.setMsg("更新地址成功");
        addressmapper.updateAddre(addre.getUserid(),addre.getId(),addre.getReceiverName(),addre.getReceiverMobile(), addre.getReceiverProvince(),addre.getReceiverCity(),addre.getReceiverAddress(),addre.getReceiverZip());
        return addrSuccResult;
    }

    @Override
    public AddrSuccResult deleAddre(int id) {
        AddrSuccResult addrSuccResult = new AddrSuccResult();
        addrSuccResult.setStatus(0);
        addrSuccResult.setMsg("删除地址成功");
        addressmapper.deleteAddre(id);
        return addrSuccResult;
    }
}
