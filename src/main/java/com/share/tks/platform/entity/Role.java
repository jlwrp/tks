package com.share.tks.platform.entity;

public class Role {
    private int id;
    private String rolename;
    private String roledescript;


    public Role(){
        super();
    }

    public Role(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRolename() {
        return rolename;
    }

    public void setRolename(String rolename) {
        this.rolename = rolename;
    }

    public String getRoledescript() {
        return roledescript;
    }

    public void setRoledescript(String roledescript) {
        this.roledescript = roledescript;
    }
}
