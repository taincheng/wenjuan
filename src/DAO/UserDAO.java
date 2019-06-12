package DAO;

import bean.User;
import util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {
    /*
    添加新用户
     */
    public void add(User user){
        String sql = "insert into user values(null,?,?,?)";
        try (Connection con = DBUtil.getConnection(); PreparedStatement ps = con.prepareStatement(sql)){
            ps.setString(1,user.getUsername());
            ps.setString(2,user.getPassword());
            ps.setInt(3,user.getPersonID());
            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();
            if(rs.next()){
                int id = rs.getInt(1);
                user.setId(id);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
    }
    /*
    用户注销
    管理员和普通用户都可用
     */
    public void delete(int id){
        String sql = "delete from user where id = ?";
        try (Connection con = DBUtil.getConnection(); PreparedStatement ps = con.prepareStatement(sql);){
            ps.setInt(1,id);
            ps.execute();
        }catch (SQLException e){
            e.printStackTrace();
        }
    }
    /*
    修改用户信息
    账号，密码
     */
    public void Update(User user){
        String sql = "update user set username = ?,password=?,personID = ? where id=?";
        try(Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql);){
            ps.setString(1,user.getUsername());
            ps.setString(2,user.getPassword());
            ps.setInt(3,user.getPersonID());
            ps.setInt(4,user.getId());

            ps.execute();
        }catch (SQLException e){
            e.printStackTrace();
        }
    }
    /*
    得到用户的信息
    用于登陆
     */
    public User get(String username, String password){
        User user = null;
        String sql = "select * from user where username= ? and password = ?";
        try (Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql);){
            ps.setString(1,username);
            ps.setString(2,password);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                user = new User();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setPersonID(rs.getInt("personID"));
                user.setPassword(rs.getString("password"));
            }
        }catch (SQLException  e){
            e.printStackTrace();
        }
        return user;
    }
    /*
    得到用户的权限信息
    personID
     */
    public int getPersonID(String username){
        User user = get(username);
        return user.getPersonID();
    }
    /*
    判断用户是否存在
     */
    public boolean isExist(String username) {
        User user = get(username);
        return user!=null;

    }

    /*
    得到用户信息
     */
    public User get(String username) {
        User user = null;

        String sql = "select * from User where username = ?";
        try (Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, username);
            ResultSet rs =ps.executeQuery();
            if (rs.next()) {
                user = new User();
                int id = rs.getInt("id");
                user.setPersonID(rs.getInt("personID"));
                user.setId(id);
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }
}
