package com.share.tks.platform.entity;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class User implements UserDetails{
    private int id;
    private String username;
    private String password;
    private String state;

    // 用户角色信息
    private List<Role> roles;
    // 权限集合数据
    private String roleArray;

    public List<Role> getRoles() {
        return roles;
    }

    public void setRoles(List<Role> roles) {
        this.roles = roles;
    }

    public String getRoleArray() {
        return roleArray;
    }

    public void setRoleArray(String roleArray) {
        this.roleArray = roleArray;
    }


    public User(){
        super();
    }

    public User(int id){
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        List<GrantedAuthority> auths = new ArrayList<GrantedAuthority>();
        if(this.getRoles()!=null){
            List<Role> roles=this.getRoles();
            for(Role role:roles){
                if(role.getRolename()!=null){
                    auths.add(new SimpleGrantedAuthority(role.getRolename()));
                }
            }
        }
        return auths;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }
    /*
      * 功能描述：组装角色数据集合
     * @param roleArray
     */
    public void packagingRoles(String roleArray){
        List<Role> roles = new ArrayList<Role>();
        if(roleArray!=null){
            Role role = null;
            for(String roleId:roleArray.split(",")){
                if(!roleId.isEmpty()){
                    role = new Role();
                    role.setId(Integer.parseInt(roleId));
                    roles.add(role);
                }
            }
        }
        this.setRoles(roles);
    }
}
