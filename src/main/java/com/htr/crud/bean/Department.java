package com.htr.crud.bean;

public class Department {
    private Integer deptId;

    private String deptNam3e;

    public Integer getDeptId() {
        return deptId;
    }

    public Department() {
    }

    public Department(Integer deptId, String deptNam3e) {
        this.deptId = deptId;
        this.deptNam3e = deptNam3e;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

    public String getDeptNam3e() {
        return deptNam3e;
    }

    public void setDeptNam3e(String deptNam3e) {
        this.deptNam3e = deptNam3e == null ? null : deptNam3e.trim();
    }
}