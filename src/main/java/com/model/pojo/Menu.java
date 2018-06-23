package com.model.pojo;

import java.util.List;

import com.model.system.OneMenu;
import com.model.system.TwoMenu;

public class Menu {

	private OneMenu oneMenu;
	private List<TwoMenu> menu;

	public OneMenu getOneMenu() {
		return oneMenu;
	}

	public void setOneMenu(OneMenu oneMenu) {
		this.oneMenu = oneMenu;
	}

	public List<TwoMenu> getMenu() {
		return menu;
	}

	public void setMenu(List<TwoMenu> menu) {
		this.menu = menu;
	}

}
