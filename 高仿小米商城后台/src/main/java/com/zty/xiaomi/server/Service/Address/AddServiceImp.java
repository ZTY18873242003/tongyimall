package com.zty.xiaomi.server.Service.Address;

import com.zty.xiaomi.server.Dao.Address;
import com.zty.xiaomi.server.Entity.Address.AddrResult;
import com.zty.xiaomi.server.Entity.Address.AddrSuccResult;
import com.zty.xiaomi.server.Entity.Address.Addre;
import com.zty.xiaomi.server.Entity.Address.AddreList;
import com.zty.xiaomi.server.utils.SqlSessionUtil;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Service;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

@Service
public class AddServiceImp implements AddService {

    @Override
    public AddrSuccResult inseAddre(Addre addre) throws IOException {
        AddrSuccResult addrSuccResult = new AddrSuccResult();
        addrSuccResult.setStatus(0);
        addrSuccResult.setMsg("新建地址成功");

        SqlSession sqlSession= SqlSessionUtil.getInstance();
        sqlSession.getMapper(Address.class).inseAddre(addre.getUserid(),addre.getReceiverName(),addre.getReceiverMobile(),
                addre.getReceiverProvince(),addre.getReceiverCity(),addre.getReceiverAddress(),addre.getReceiverZip());
        sqlSession.commit();

        return addrSuccResult;

    }

    @Override
    public AddrResult getAll(String userid) throws IOException {
        SqlSession sqlSession=SqlSessionUtil.getInstance();
        AddrResult addrResult = new AddrResult();
        addrResult.setStatus(0);

        AddreList addreList = new AddreList();

        List<Addre> addres = sqlSession.getMapper(Address.class).getAll(userid);
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
    public AddrSuccResult updaAddre(Addre addre) throws IOException {
        AddrSuccResult addrSuccResult = new AddrSuccResult();
        addrSuccResult.setStatus(0);
        addrSuccResult.setMsg("更新地址成功");


        SqlSession sqlSession=SqlSessionUtil.getInstance();
        sqlSession.getMapper(Address.class).updateAddre(addre.getUserid(),addre.getId(),addre.getReceiverName(),addre.getReceiverMobile(),
                addre.getReceiverProvince(),addre.getReceiverCity(),addre.getReceiverAddress(),addre.getReceiverZip());

        sqlSession.commit();

        return addrSuccResult;
    }

    @Override
    public AddrSuccResult deleAddre(int id) throws IOException {
        AddrSuccResult addrSuccResult = new AddrSuccResult();
        addrSuccResult.setStatus(0);
        addrSuccResult.setMsg("删除地址成功");

        SqlSession sqlSession=SqlSessionUtil.getInstance();
        sqlSession.getMapper(Address.class).deleteAddre(id);
        sqlSession.commit();

        return addrSuccResult;
    }
}
