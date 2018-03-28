package br.com.sysadv.action;

import br.com.sysadv.bean.Contato;
import br.com.sysadv.bean.Endereco;
import br.com.sysadv.bean.Usuario;
import br.com.sysadv.dao.ContatoDAO;
import br.com.sysadv.dao.EnderecoDAO;
import com.opensymphony.xwork2.ActionSupport;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;

@ParentPackage(value = "json-default")
public class ContatoAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	public Contato contato;
	public List<Contato> listaContatos;
	public List<Endereco> listaCidades;
	public Long codigoContato;
	public String nomeContato = null;

	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	Usuario usuarioLog = (Usuario) session.getAttribute("usuarioLogado");

	public String foto;// = "data:image/png;base64,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";

	public String getFoto() {
		return foto;
	}

	public void setFoto(String foto) {
		this.foto = foto;
	}

	@Action(value = "salvarContato", results = { @Result(name = "success", location = "/paginas/listarContatos.jsp"),
			@Result(name = "erro", location = "/paginas/login.jsp") })
	public String salvarContato() {
		if (usuarioLog == null) {
			return "erro";
		}
		ContatoDAO dao = new ContatoDAO();
		EnderecoDAO enderecoDAO = new EnderecoDAO();
		if (this.contato.getFoto() == null) {
			contato.setFoto(foto);
		}
		dao.salvar(this.contato);
		this.listaContatos = dao.listarContatos(this.nomeContato);
		this.listaCidades = enderecoDAO.listarEndereco(null);
		return "success";
	}

	@Action(value = "novoContato", results = { @Result(name = "success", location = "/paginas/novoContato.jsp"),
			@Result(name = "erro", location = "/paginas/login.jsp") })
	public String novoContato() {
		if (usuarioLog == null) {
			return "erro";
		}
		EnderecoDAO enderecoDAO = new EnderecoDAO();
		this.listaCidades = enderecoDAO.listarEndereco(null);
		return "success";
	}

	@Action(value = "alterarContato", results = { @Result(name = "success", location = "/paginas/alterarCadastro.jsp"),
			@Result(name = "erro", location = "/paginas/login.jsp") })
	public String alteraContato() {
		if (usuarioLog == null) {
			return "erro";
		}
		EnderecoDAO enderecoDAO = new EnderecoDAO();
		ContatoDAO dao = new ContatoDAO();
		this.listaCidades = enderecoDAO.listarEndereco(null);
		this.contato = new Contato();
		this.contato = dao.pegarContatoPeloCodigo(this.codigoContato);
		return "success";
	}

	@Action(value = "confirmarAlteracao", results = {
			@Result(name = "success", location = "/paginas/listarContatos.jsp"),
			@Result(name = "erro", location = "/paginas/login.jsp") })
	public String confirmarAlteracao() {
		if (usuarioLog == null) {
			return "erro";
		}
		ContatoDAO dao = new ContatoDAO();
		dao.alterar(this.contato);
		this.listaContatos = dao.listarContatos(this.nomeContato);
		return "success";
	}

	@Action(value = "listarContatos", results = { @Result(name = "success", location = "/paginas/listarContatos.jsp"),
			@Result(name = "erro", location = "/paginas/login.jsp") })
	public String listarContatos() {
		if (usuarioLog == null) {
			return "erro";
		}
		ContatoDAO dao = new ContatoDAO();
		this.listaContatos = dao.listarContatos(this.nomeContato);
		return "success";
	}

	@Action(value = "listarContatosAJAX", results = { @Result(name = "success", type = "json") })
	public String listarContatosAJAX() {
		ContatoDAO dao = new ContatoDAO();
		this.listaContatos = dao.listarContatos(this.nomeContato);
		return "success";
	}

	@Action(value = "excluirCliente", results = { @Result(name = "success", location = "/paginas/listarContatos.jsp"),
			@Result(name = "erro", location = "/paginas/login.jsp") })
	public String excluirCliente() {
		if (usuarioLog == null) {
			return "erro";
		}
		ContatoDAO dao = new ContatoDAO();
		dao.excluir(this.codigoContato);
		this.listaContatos = dao.listarContatos(this.nomeContato);
		return "success";
	}

	@Action(value = "finalizarSessao", results = { @Result(name = "success", location = "/paginas/login.jsp") })
	public String finalizarSessao() {
		if (session != null) {
			session.invalidate();
		}
		return "success";
	}

	public Contato getContato() {
		return this.contato;
	}

	public void setContato(Contato contato) {
		this.contato = contato;
	}

	public List<Contato> getListaContatos() {
		return this.listaContatos;
	}

	public void setListaContatos(List<Contato> listaContatos) {
		this.listaContatos = listaContatos;
	}

	public List<Endereco> getListaCidades() {
		return this.listaCidades;
	}

	public String getNomeContato() {
		return this.nomeContato;
	}

	public void setNomeContato(String nomeContato) {
		this.nomeContato = nomeContato;
	}

	public Long getCodigoContato() {
		return this.codigoContato;
	}

	public void setCodigoContato(Long codigoContato) {
		this.codigoContato = codigoContato;
	}
}
