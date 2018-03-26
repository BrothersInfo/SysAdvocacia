package br.com.sysadv.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import br.com.sysadv.bean.Usuario;
import br.com.sysadv.dao.LoginDAO;

@ParentPackage(value = "json-default")
public class LoginAction extends ActionSupport {

	private static final long serialVersionUID = 2076314045036891859L;

	private boolean acessoPermitido;
	private Usuario usuario;
	private String status;

	@Action(value = "logarNoSistema", results = { @Result(name = "success", type = "json") })
	public String logarNoSistema() {
		LoginDAO dao = new LoginDAO();
		acessoPermitido = dao.verificarLogin(usuario.getEmail(), usuario.getSenha());
		if (acessoPermitido == true) {
			ActionContext.getContext().getSession().put("usuarioLogado", usuario);
		}
		return "success";
	}

	@Action(value = "salvarUsuario", results = { @Result(name = "success", location = "/paginas/login.jsp") })
	public void salvarUsuario() {
		LoginDAO dao = new LoginDAO();
		if (dao.salvarUsuario(usuario)) {
			status = "ok";
		} else {
			status = "erro";
		}
	}

	public boolean isAcessoPermitido() {
		return acessoPermitido;
	}

	public void setAcessoPermitido(boolean acessoPermitido) {
		this.acessoPermitido = acessoPermitido;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

}
