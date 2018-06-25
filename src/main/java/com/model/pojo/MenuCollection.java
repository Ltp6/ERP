package com.model.pojo;

import java.util.List;

import com.model.system.OneMenu;
import com.model.system.TwoMenu;

public class MenuCollection {

	private String oneMenuId;

	private String oneMenuName;

	private String menuIcon;

	private String twoMenuId;

	private String twoMenuName;

	private String twoMenuUrl;

	public String getOneMenuId() {
		return oneMenuId;
	}

	public void setOneMenuId(String oneMenuId) {
		this.oneMenuId = oneMenuId;
	}

	public String getOneMenuName() {
		return oneMenuName;
	}

	public void setOneMenuName(String oneMenuName) {
		this.oneMenuName = oneMenuName;
	}

	public String getMenuIcon() {
		return menuIcon;
	}

	public void setMenuIcon(String menuIcon) {
		this.menuIcon = menuIcon;
	}

	public String getTwoMenuId() {
		return twoMenuId;
	}

	public void setTwoMenuId(String twoMenuId) {
		this.twoMenuId = twoMenuId;
	}

	public String getTwoMenuName() {
		return twoMenuName;
	}

	public void setTwoMenuName(String twoMenuName) {
		this.twoMenuName = twoMenuName;
	}

	public String getTwoMenuUrl() {
		return twoMenuUrl;
	}

	public void setTwoMenuUrl(String twoMenuUrl) {
		this.twoMenuUrl = twoMenuUrl;
	}
	
}
