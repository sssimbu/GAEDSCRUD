package com.gae.crud;

import java.util.List;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.FetchOptions;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Query.Filter;
import com.google.appengine.api.datastore.Query.FilterOperator;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;

public class Test {

	public static DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
	// static Entity person = new Entity("person",id);

	static boolean value;

	public static boolean CreateorUpdate(String id, String name, String email, String password) {
		System.out.println("createorupdate person");
		Entity person = new Entity("person", id);
		person.setProperty("id", id);
		person.setProperty("name", name);
		person.setProperty("email", email);
		person.setProperty("password", password);
		ds.put(person);
		System.out.println("the person value:" + person);
		Key k = KeyFactory.createKey("person", id);
		System.out.println("The key value is:" + person.getKey() + "the kind value is:" + person.getKind());

		return true;
	}

	/*
	 * public static Iterable<Entity> ListPerson(String kind, String id) {
	 * System.out.println("The kind is:" + kind + "id is:" + id); Query q = new
	 * Query(kind).addSort("id", Query.SortDirection.ASCENDING);
	 * Iterable<Entity> pq =
	 * ds.prepare(q).asIterable(FetchOptions.Builder.withLimit(10)); return pq;
	 * }
	 */

	public static boolean LoginTest(String name, String password) {
		String uname = null;
		String pswd = null;

		Query q = new Query("person");
		PreparedQuery pq = ds.prepare(q);
		// List<Entity> res = pq.asList(FetchOptions.Builder.withLimit(2));
		for (Entity var : pq.asIterable()) {
			uname = (String) var.getProperty("name");
			pswd = (String) var.getProperty("password");
			System.out.println("username and passwords are:" + uname + "and" + pswd);

			if (pswd != null && pswd.equalsIgnoreCase(password) && uname.equalsIgnoreCase(name)) {
				/*
				 * System.out.println("loop will break"); break;
				 */
				System.out.println("returened true");
				return true;

			}
		}
		System.out.println("outside for loop::from db:" + uname + "&&" + pswd + "entered::" + password + "&&" + name);
		/*
		 * if(value) return true; else return false;
		 */

		/*
		 * if
		 * (pswd!=null&&pswd.equalsIgnoreCase(password)&&uname.equalsIgnoreCase(
		 * name)) //&&
		 * pswd.equalsIgnoreCase(password)&&uname.equalsIgnoreCase(name) return
		 * true; else
		 */

		return false;
	}

	public static void DeleteTest(String id) {
		// deleting the person
		Key personkey = KeyFactory.createKey("person", id);
		System.out.println("test.DeleteTest method");
		System.out.println("The person key value:" + personkey);
		ds.delete(personkey);
	}

}
