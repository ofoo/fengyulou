package com.guoguo.fengyulou.computer.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.guoguo.common.ServerResponse;
import com.guoguo.fengyulou.computer.dao.ComputerDao;
import com.guoguo.fengyulou.computer.entity.Computer;
import com.guoguo.util.ObjectUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ComputerService {

    @Autowired
    private ComputerDao computerDao;

    /**
     * 按条件查询查询
     * @param computer
     * @return
     */
    public List<Computer> getComputerList(Computer computer) {
        return computerDao.getComputerList(computer);
    }

    /**
     * 按条件分页查询
     * @param computer
     * @return
     */
    public PageInfo<Computer> getComputerListPage(Computer computer) {
        PageHelper.startPage(computer.getPageNum() == null ? 1 : computer.getPageNum(), computer.getPageSize() == null ? 10 : computer.getPageSize());
        List<Computer> list = computerDao.getComputerList(computer);
        PageInfo<Computer> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    /**
     * 保存数据
     * @param computer
     * @return
     */
    public ServerResponse saveComputer(Computer computer) {
        // 去除空格
        computer.setHost(computer.getHost().trim());
        computer.setPort(computer.getPort().trim());
        computer.setAccount(computer.getAccount().trim());
        computer.setPassword(computer.getPassword().trim());
        if (ObjectUtils.isNotNull(computer.getId())) {
            // 验证数据是否重复
            /*int count = computerDao.getComputerCountByComputer(computer);
            if (count > 0) {
                return ServerResponse.createByError(ResponseCode.EXIST);
            }*/
            // 按id修改数据
            int rows = computerDao.updateComputerByIdAndUserId(computer);
            if (rows > 0) {
                return ServerResponse.createBySuccess();
            }
        } else {
            // 验证数据是否重复
            /*int count = computerDao.getComputerCountByNameAndUserId(computer);
            if (count > 0) {
                return ServerResponse.createByError(ResponseCode.EXIST);
            }*/
            // 添加数据
            int rows = computerDao.insertComputer(computer);
            if (rows > 0) {
                return ServerResponse.createBySuccess(computer.getId());
            }
        }
        return ServerResponse.createByError();
    }

    /**
     * 按id和用户id查询
     * @param computer
     * @return
     */
    public Computer getComputerByIdAndUserId(Computer computer) {
        if (ObjectUtils.isNull(computer.getId())) {
            return null;
        }
        return computerDao.getComputerByIdAndUserId(computer);
    }

    /**
     * 按id和用户删除
     * @param ids
     * @param userId
     * @return
     */
    public ServerResponse deleteComputerByIdsAndUserId(List<Long> ids, Long userId) {
        int rows = computerDao.deleteComputerByIdsAndUserId(ids, userId);
        if (rows > 0) {
            return ServerResponse.createBySuccess();
        }
        return ServerResponse.createByError();
    }
}
