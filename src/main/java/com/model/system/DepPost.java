package com.model.system;

public class DepPost {
	

	private String staId;
	private String loginName;
	private String staName;
	private String postId;
	
	private String depId;
	
	private String depName;
	
	private String postName;
	
	@Override
	public String toString() {
		return "DepPost [staId=" + staId + ", loginName=" + loginName + ", staName=" + staName + ", postId=" + postId
				+ ", depId=" + depId + ", depName=" + depName + ", postName=" + postName + "]";
	}
	public String getStaId() {
		return staId;
	}

	public void setStaId(String staId) {
		this.staId = staId;
	}

	
    public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getStaName() {
		return staName;
	}

	public void setStaName(String staName) {
		this.staName = staName;
	}


    public String getPostId() {
        return postId;
    }

    public void setPostId(String postId) {
        this.postId = postId;
    }

    public String getDepId() {
        return depId;
    }

    public void setDepId(String depId) {
        this.depId = depId;
    }

    public String getDepName() {
        return depName;
    }

    public void setDepName(String depName) {
        this.depName = depName;
    }

    public String getPostName() {
        return postName;
    }

    public void setPostName(String postName) {
        this.postName = postName;
    }
}