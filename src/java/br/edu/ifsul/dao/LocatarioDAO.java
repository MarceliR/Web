/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifsul.dao;

import br.edu.ifsul.jpa.EntityManagerUtil;
import br.edu.ifsul.modelo.Locatario;
import br.edu.ifsul.util.Util;

import java.io.Serializable;
import java.util.List;
import java.util.Set;
import javax.persistence.EntityManager;
import javax.validation.ConstraintViolation;
import javax.validation.OverridesAttribute;
import javax.validation.Validation;
import javax.validation.Validator;

/**
 *
 * @author Marcely
 */
public class LocatarioDAO implements Serializable {

    private Locatario objetoSelecionado;
    private String mensagem = "";
    private EntityManager em;

    public LocatarioDAO() {
        em = EntityManagerUtil.getEntityManager();
    }

    public boolean validaObjeto(Locatario obj) {
        //criacao do objeto que valida os dados da classe Locatario
        Validator validador = Validation.buildDefaultValidatorFactory().getValidator();
        Set<ConstraintViolation<Locatario>> erros = validador.validate(obj);
        if (erros.size() > 0) {//caso caia neste teste o objeto tem erros
            mensagem = "";//montando a mensagem com os erros para o usuario
            mensagem += "Objeto com erros: <br/>";
            for (ConstraintViolation<Locatario> erro : erros) {
                mensagem += "Erro" + erro.getMessage() + "<br/>";
            }
            return false;
        } else {
            return true;
        }
    }

    public List<Locatario> getLista(){
        return em.createQuery("from Locatario order by nome").getResultList();
    }
    
    public boolean salvar (Locatario obj){
        try{
            em.getTransaction().begin();
            //System.out.println(obj);
            if (obj.getId() == null){
                
                em.persist(obj);
                
            }else{
                em.merge(obj);
            }
            em.getTransaction().commit();
            mensagem = "Objeto persistido com sucesso";
            return true;
        }catch (Exception e){
            if (em.getTransaction().isActive() == false){
                em.getTransaction().begin();
            }
            em.getTransaction().rollback();
            mensagem = "Erro ao persistir objeto:"+Util.getMensagemErro(e);
            return false;
            }
        
    }
    
    public boolean remover (Locatario obj){
        try{
            em.getTransaction().begin();
            em.remove(obj);
            em.getTransaction().commit();
            mensagem = "Objeto removido com sucesso";
            return true;
        }catch (Exception e){
            if (em.getTransaction().isActive() == false){
                em.getTransaction().begin();
            }
            em.getTransaction().rollback();
            mensagem = "Erro ao persistir objeto:"+Util.getMensagemErro(e);
            return false;
            }
        
    }
    
    public Locatario localizar (Integer id){
        return em.find(Locatario.class, id);
    }
    
    public Locatario getObjetoSelecionado() {
        return objetoSelecionado;
    }

    public void setObjetoSelecionado(Locatario objetoSelecionado) {
        this.objetoSelecionado = objetoSelecionado;
    }

    public String getMensagem() {
        return mensagem;
    }

    public void setMensagem(String mensagem) {
        this.mensagem = mensagem;
    }

    public EntityManager getEm() {
        return em;
    }

    public void setEm(EntityManager em) {
        this.em = em;
    }

}
