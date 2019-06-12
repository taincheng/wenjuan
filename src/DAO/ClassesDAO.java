package DAO;

import bean.Classes;
import servlet.ContorclassServlet;
import util.DBUtil;
import util.DateUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;

public class ClassesDAO {
    /*
    添加classes
     */
    public void add(Classes classes){
        String sql = "insert into classes values(null,?,?,?,?,?)";
        try(Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql);){
            ps.setString(1,classes.getClassname());
            ps.setInt(2,classes.getClasstime());
            ps.setInt(3,classes.getIsuse());
            ps.setTimestamp(4, DateUtil.d2t(classes.getAddtime()));
            ps.setString(5,classes.getIntroduction());
            ps.execute();
            ResultSet rs = ps.getGeneratedKeys();
            while (rs.next()){
                classes.setId(rs.getInt(1));
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
    }
    /*
    得到课题总数数目
     */
    public int getTotal(){
        int total = 0;
        try(Connection c = DBUtil.getConnection(); Statement s = c.createStatement();){
            String sql = "select count(*) from classes";
            ResultSet rs = s.executeQuery(sql);
            while (rs.next()){
                total = rs.getInt(1);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return total;
    }

    /*
    分页条件得到课题
     */

    public ArrayList<Classes> getList(int start, int count){
        ArrayList<Classes> arrayList = new ArrayList<>();
        String sql = "select * from classes order by id limit ?,?";
        try(Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql);){
            ps.setInt(1,start);
            ps.setInt(2,count);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                Classes classes = new Classes();
                int id = rs.getInt("id");
                String classesname = rs.getString("classname");
                int classtime = rs.getInt("classtime");
                int isuse = rs.getInt("isuse");
                Date addtime = DateUtil.t2d(rs.getTimestamp("addtime"));
                String introduction = rs.getString("introduction");

                classes.setId(id);
                classes.setClassname(classesname);
                classes.setClasstime(classtime);
                classes.setIsuse(isuse);
                classes.setAddtime(addtime);
                classes.setIntroduction(introduction);
                arrayList.add(classes);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return arrayList;
    }
    /*
    删除class
     */
    public void delete(int id){
        String sql = "delete from classes where id = ?";
        try (Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql);){
            ps.setInt(1,id);
            ps.execute();
        }catch (SQLException e){
            e.printStackTrace();
        }
    }
    /*
    停用或者启用
     */
    public int isuse(int id, int isuse){
        String sql = "UPDATE classes set isuse = ? where id = ?;";
        try (Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql);){
            if(isuse == 0) isuse = 1;
            else isuse = 0;
            ps.setInt(1,isuse);
            ps.setInt(2,id);
            ps.execute();
        }catch (SQLException e){
            e.printStackTrace();
        }
        return isuse;
    }
    /*
    classes的编辑
     */
    public void edit(int id, String classname, int classtime, String introduction){
        String sql = "update classes set classname = ?, classtime = ?, addtime = ?, introduction = ? where id = ?";
        try(Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql);){
            ps.setString(1,classname);
            ps.setInt(2,classtime);
            ps.setTimestamp(3,DateUtil.d2t(new Date()));
            ps.setString(4,introduction);
            ps.setInt(5,id);
            ps.execute();
        }catch (SQLException e){
            e.printStackTrace();
        }
    }
}
