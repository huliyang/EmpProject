package cn.hly.util.servlet;

import java.io.IOException;
import java.lang.reflect.Method;
import java.text.MessageFormat;
import java.util.Locale;
import java.util.ResourceBundle;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public abstract class DispatcherServlet extends HttpServlet{

	private static final String PAGES_BASENAME = "Pages";
	private static final String MESSAGES_BASENAME = "Messages";
	private ResourceBundle pageBundle = null;
	private ResourceBundle messageBundle = null;
	protected HttpServletRequest request = null;
	protected HttpServletResponse response = null;
	
	@Override
	public void init() throws ServletException {
		this.pageBundle = ResourceBundle.getBundle(PAGES_BASENAME, Locale.getDefault());
		this.messageBundle = ResourceBundle.getBundle(MESSAGES_BASENAME, Locale.getDefault());
	}
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.request = request;
		this.response = response;
		String path = this.getPath("errors.page");
		//根据请求的URL取得操作名称
		String operateName = request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/")+1);
		if(operateName != null && operateName.length() > 0) {
			try {
				Method method = this.getClass().getMethod(operateName);
				String returnType = method.getAnnotatedReturnType().getType().getTypeName();
				if(!"void".equals(returnType)) { //表示调用的方法有返回值，设置跳转路径
					path = (String)method.invoke(this); //反射调用方法
					request.getRequestDispatcher(path).forward(request, response);	
				} else { //没有返回值，直接调用方法即可，不用执行跳转
					method.invoke(this);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} 
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
	}
	
	/**
	 * 取得Pages.properties文件中定义的访问路径
	 * 
	 * @param key 访问路径的关键字
	 * @return 根据key返回配置文件中的跳转路径，如果没有返回null
	 */
	public String getPath(String key) {
		return this.pageBundle.getString(key);
	}
	/**
	 * 取得Messages.properties文件中的提示信息
	 * 
	 * @param key  提示信息的关键字
	 * @param args 占位符的内容
	 * @return 配置文件的提示信息，如果没有返回null
	 */
	public String getMsg(String key, Object... args) {
		String msg = this.messageBundle.getString(key);
		if (args.length > 0 || this.getTitle() == null) {
			return MessageFormat.format(msg, args);
		} else {
			return MessageFormat.format(msg, this.getTitle());
		}
	}
	/**
	 * 由子类负责实现，设置提示的信息的占位符内容
	 * 
	 * @return 不同子类的描述信息
	 */
	public abstract String getTitle();
}
