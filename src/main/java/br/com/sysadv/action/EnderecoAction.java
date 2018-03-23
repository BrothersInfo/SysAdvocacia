package br.com.sysadv.action;

import br.com.sysadv.bean.Endereco;
import br.com.sysadv.dao.EnderecoDAO;
import com.opensymphony.xwork2.ActionSupport;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;

@ParentPackage(value = "json-default")
public class EnderecoAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	public Endereco cidade;
	public List<Endereco> listaCidades;
	public Long codigoCidade;
	public String nomeCidade;

	@Action(value = "listarCidades", results = { @Result(name = "success", location = "/paginas/listarCidades.jsp") })
	public String listarEnderecos() {
		EnderecoDAO dao = new EnderecoDAO();
		this.listaCidades = dao.listarEndereco(this.nomeCidade);
		return "success";
	}

	@Action(value = "listarCidadesAJAX", results = { @Result(name = "success", type = "json") })
	public String listarEnderecosAJAX() {
		EnderecoDAO dao = new EnderecoDAO();
		this.listaCidades = dao.listarEndereco(this.nomeCidade);
		return "success";
	}

	@Action(value = "listagem", results = { @Result(name = "success", type = "json") })
	public String listar() {
		System.out.println("PASSOU");
		EnderecoDAO dao = new EnderecoDAO();
		this.listaCidades = dao.listarEndereco(this.nomeCidade);
		return "success";
	}

	@Action(value = "alterarCidade", results = { @Result(name = "success", location = "/paginas/alterarCidade.jsp") })
	public String alterarCidade() {
		EnderecoDAO dao = new EnderecoDAO();
		this.cidade = new Endereco();
		this.cidade = dao.pegarCidadePeloCodigo(this.codigoCidade);
		return "success";
	}

	@Action(value = "salvarCidade", results = { @Result(name = "success", location = "/paginas/listarCidades.jsp") })
	public String salvarCidade() {
		EnderecoDAO dao = new EnderecoDAO();
		dao.salvar(this.cidade);
		this.listaCidades = dao.listarEndereco(this.nomeCidade);
		return "success";
	}

	@Action(value = "novaCidade", results = { @Result(name = "success", location = "/paginas/novaCidade.jsp") })
	public String novaCidade() {
		return "success";
	}

	@Action(value = "confirmarAlteracaoCidade", results = {
			@Result(name = "success", location = "/paginas/listarCidades.jsp") })
	public String confirmarAlteracaoCidade() {
		EnderecoDAO dao = new EnderecoDAO();
		dao.alterar(this.cidade);
		this.listaCidades = dao.listarEndereco(this.nomeCidade);
		return "success";
	}

	@Action(value = "excluirCidade", results = { @Result(name = "success", location = "/paginas/listarCidades.jsp") })
	public String excluirCidade() {
		EnderecoDAO dao = new EnderecoDAO();
		dao.excluir(this.codigoCidade);
		this.listaCidades = dao.listarEndereco(null);
		return "success";
	}

	@Action("demo1")
	public void demo1() {
		try {
			HttpServletResponse response = ServletActionContext.getResponse();
			PrintWriter out = response.getWriter();

			out.print("BrothersInfo Informática...");
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public Long getCodigoCidade() {
		return this.codigoCidade;
	}

	public void setCodigoCidade(Long codigoCidade) {
		this.codigoCidade = codigoCidade;
	}

	public Endereco getCidade() {
		return this.cidade;
	}

	public void setCidade(Endereco cidade) {
		this.cidade = cidade;
	}

	public List<Endereco> getListaCidades() {
		return this.listaCidades;
	}

	public void setListaCidades(List<Endereco> listaCidades) {
		this.listaCidades = listaCidades;
	}

	public String getNomeCidade() {
		return this.nomeCidade;
	}

	public void setNomeCidade(String nomeCidade) {
		this.nomeCidade = nomeCidade;
	}
}