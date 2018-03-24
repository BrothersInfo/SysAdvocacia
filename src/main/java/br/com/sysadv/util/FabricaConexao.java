package br.com.sysadv.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
//import java.util.Properties;

//import javax.naming.NamingException;
//import javax.sql.DataSource;

//import org.springframework.jndi.JndiTemplate;

public class FabricaConexao {
	public static final String DRIVER = "com.mysql.jdbc.Driver";
	public static final String BANCO = "sysadvocacia";
	// public static final String PONTE = "jdbc:mysql://127.0.0.1:3306/" +
	// BANCO;
	public static final String PONTE = "jdbc:mysql://sysadvocacia.mysql.uhserver.com:3306/" + BANCO;
	public static final String USUARIO = "root";
	public static final String SENHA = "root1";
	public static Connection conexao = null;

	public static Connection getConexao() {
		try {
			Class.forName(DRIVER);
			conexao = DriverManager.getConnection(PONTE, USUARIO, SENHA);

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return conexao;
	}

	/*
	 * public static void main(String[] args) { for (int i = 0; i < 1000; i++) {
	 * System.out.println("Conectado com sucesso " + i); getConexao();
	 * desconectar(); } }
	 */

	public static void desconectar() {
		if (conexao != null) {
			try {
				conexao.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	/*
	 * private static Connection conexao = null;
	 * 
	 * public static DataSource getDataSource() { DataSource dataSource = null;
	 * try { Properties brothers = new Properties();
	 * brothers.setProperty("sourceLegado", "java:jboss/sistema"); JndiTemplate
	 * template = new JndiTemplate(); dataSource = (DataSource)
	 * template.lookup(brothers.getProperty("sourceLegado")); System.out.
	 * println("BrothersInfo System - Conexão utilizando JNDI funcionando corretamente"
	 * ); } catch (NamingException ne) { System.out.println("ERRO\n" +
	 * ne.getMessage()); } return dataSource; }
	 * 
	 * public static Connection getConexao() { try { conexao =
	 * getDataSource().getConnection(); } catch (SQLException e) {
	 * e.printStackTrace(); } return conexao; }
	 */

	/*
	 * public static void desconectar() { try { if (conexao != null) {
	 * conexao.close(); } } catch (SQLException e) { e.printStackTrace(); } }
	 */
}