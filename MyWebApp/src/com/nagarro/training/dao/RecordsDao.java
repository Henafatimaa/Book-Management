package com.nagarro.training.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.nagarro.hibernate.util.HibernateUtil;
import com.nagarro.training.model.Records;
/**Author HenaFatima*/
public class RecordsDao {



	public void addProductDetails(String title, String quantity, String size, String image) {
		// TODO Auto-generated method stub
		Transaction transaction = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// try(Session session = sf.openSession()){
			// start a transaction
			transaction = session.beginTransaction();

			Records record = new Records();


			record.setTitle(title);
			record.setQuantity(quantity);
			record.setSize(size);
			record.setImage(image);


			session.save(record);
			transaction.commit();
			System.out.println("\n\n Details Added \n");

		} catch (HibernateException e) {
			System.out.println(e.getMessage());
			System.out.println("error");
		}
	}
	public List<Records> getProducts(){
		Transaction transaction = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// try(Session session = sf.openSession()){
			// start a transaction
			transaction = session.beginTransaction();
			List <Records> productList= session.createQuery("from Records").list();
			transaction.commit();
			session.close();
			for (Records r:productList) {
				System.out.println(r.getTitle());

			}
			return productList;
		}catch(HibernateException e) {
			System.out.println(e.getMessage());
		}
		return null;

	}
	
	public void updateProductDetails(int id,String title, String quantity, String size, String image) {
		Transaction transaction = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// try(Session session = sf.openSession()){
			// start a transaction
			transaction = session.beginTransaction();

		//	Records record = new Records();
//
//			String a="update records set title="+'"'+title+'"'+",quantity="+'"'+quantity+'"'+",size="+'"'+size+'"'+",image="+'"'+image+'"'+", where id="+'"'+id+'"'+";";
//			
//			session.createQuery(a).executeUpdate();
			
			Records record = session.load(Records.class, id);
			record.setTitle(title);
			record.setQuantity(quantity);
			record.setSize(size);
			record.setImage(image);
			session.update(record);
			transaction.commit();
			System.out.println("\n\n Details Updated\n");

		} catch (HibernateException e) {
			System.out.println(e.getMessage());
			System.out.println("error");
		}
	}
	public void deleteProductDetails(int id) {
		// TODO Auto-generated method stub
		Transaction transaction = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			transaction = session.beginTransaction();
			Records record = session.load(Records.class, id);
			session.delete(record);
			
			transaction.commit();
			System.out.println("\n\n Details Deleted\n");

		} catch (HibernateException e) {
			System.out.println(e.getMessage());
			System.out.println("error");
		}
	}

	
}



