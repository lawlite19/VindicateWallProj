package com.hhit.action;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.Set;

import com.hhit.entity.TbPrivilege;
import com.hhit.entity.TbRole;
import com.hhit.entity.TbRolePrivilege;
import com.hhit.entity.TbRolePrivilegeId;
import com.hhit.service.IPrivilegeService;
import com.hhit.service.IRoleService;
import com.opensymphony.xwork2.ActionContext;

public class RoleAction {
	private IRoleService roleService;
	private IPrivilegeService privilegeService;


	private Integer[] privilegeIds;

	private TbRole role;
	private Integer id;

	/** 列表 */
	public String list() throws Exception {
		List<TbRole> roleList = roleService.findAll();
		ActionContext.getContext().put("roleList", roleList);
		return "list";
	}
	/** 添加页面 */
	public String addUI() throws Exception {
		return "saveUI";
	}
	/** 删除 */
	public String delete() throws Exception {
		roleService.delete(id);
		return "toList";
	}
	/** 添加 */
	public String add() throws Exception {
		roleService.save(role);
		return "toList";
	}

	/** 修改页面 */
	public String editUI() throws Exception {
		// 准备回显的数据
		role = roleService.getById(id);
		return "saveUI";
	}

	/** 修改 */
	public String edit() throws Exception {
		// 1，从数据库中获取原对象
		TbRole roleFind = roleService.getById(id);

		// 2，设置要修改的属性
		roleFind.setName(role.getName());
		roleFind.setDescription(role.getDescription());

		// 3，更新到数据库
		roleService.update(roleFind);

		return "toList";
	}
	/** 设置权限页面 */
	public String setPrivilegeUI() throws Exception {
		// 准备回显的数据
		TbRole rolefind = roleService.getById(id);
		ActionContext.getContext().getValueStack().push(rolefind);
		//根据RoleId获得对应的权限
		//List<TbPrivilege> privileges= rolePriIdService.getPriByRoleId(rolefind);
		

		if (rolefind.getTbRolePrivileges() != null) {
			privilegeIds = new Integer[rolefind.getTbRolePrivileges().size()];
			int index = 0;
			for (TbRolePrivilege priv : rolefind.getTbRolePrivileges()) {
				privilegeIds[index++] = priv.getId().getTbPrivilege().getId();
			}
		}
		// 准备数据 privilegeList
		//List<TbPrivilege> privilegeList = privilegeService.findAll();
		//ActionContext.getContext().put("privilegeList", privilegeList); 
		return "setPrivilegeUI";
	}

	/** 设置权限 */
	@SuppressWarnings("unchecked")
	public String setPrivilege() throws Exception {
		// 1，从数据库中获取原对象
		TbRole roleFind = roleService.getById(id);

		
		
		// 2，设置要修改的属性
			//得到前台选中的privilegeIds对
		List<TbPrivilege> privilegeList=privilegeService.getByIds(privilegeIds);
		//privilegeList.get(0).getTbRolePrivileges();
		
		List<TbRolePrivilege> rolePrivilegeList=new ArrayList<TbRolePrivilege>(privilegeList.size());
		int index=0;
		for (index=0;index<privilegeList.size();index++) {
			//privilegeIds[index++] = priv.getId().getTbPrivilege().getId();
			rolePrivilegeList.addAll(privilegeList.get(index).getTbRolePrivileges());
		}
		//rolePrivilegeList.addAll(privilegeList.get(index).getTbRolePrivileges());
		//privilegeList.get(0).get
//		List<TbRolePrivilege> rolePrin;
//		for (TbPrivilege priv : privilegeList) {
//			rolePrin.add(priv.getTbRolePrivileges());
//		}
		
		
//		TbPrivilege cd=privilegeList.get(0);
//		TbPrivilege ab=privilegeList.get(1);
//		TbPrivilege d=privilegeList.get(2);
//		TbPrivilege v=privilegeList.get(3);
//		TbRolePrivilegeId rid = null;
//		rid.setTbPrivilege(privilegeList.get(3).getTbPrivilege());
//		rid.setTbRole(roleFind);
//		
//		TbRolePrivilege roleP = null;
//		roleP.setId(rid);
//		List<TbRolePrivilege> rolePri = null;
//		rolePri.add(roleP);
//		roleFind.getTbRolePrivileges();
		roleFind.setTbRolePrivileges(new HashSet<TbRolePrivilege>(rolePrivilegeList));
		
		// 3，更新到数据库
		roleService.update(roleFind);
		//roleService.update();
		return "toList";
	}
	
	public IRoleService getRoleService() {
		return roleService;
	}

	public void setRoleService(IRoleService roleService) {
		this.roleService = roleService;
	}

	public Integer[] getPrivilegeIds() {
		return privilegeIds;
	}
	public void setPrivilegeIds(Integer[] privilegeIds) {
		this.privilegeIds = privilegeIds;
	}
	public TbRole getRole() {
		return role;
	}
	public void setRole(TbRole role) {
		this.role = role;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public IPrivilegeService getPrivilegeService() {
		return privilegeService;
	}
	public void setPrivilegeService(IPrivilegeService privilegeService) {
		this.privilegeService = privilegeService;
	}

}
