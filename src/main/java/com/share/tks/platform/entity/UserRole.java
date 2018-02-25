package com.share.tks.platform.entity;

public class UserRole {
    private int userid;
    private int roleid;
    public UserRole(){
        super();
    }

    public UserRole(int userid, int roleid) {
        this.userid = userid;
        this.roleid = roleid;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public int getRoleid() {
        return roleid;
    }

    public void setRoleid(int roleid) {
        this.roleid = roleid;
    }
}
