package com.nju.monitor.util;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.net.URISyntaxException;
import java.util.List;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.SAXReader;
import org.dom4j.io.XMLWriter;

public class XMLUtil {

	/**
	 * @param args
	 */
	public Document createXML(String rootTag){
		Document document = DocumentHelper.createDocument();
		document.addElement(rootTag);
		return document;
	}
	
    public void saveXML(Document document,File xmlFile) {
    	XMLWriter xmlWriter = null;
        try {
            // 美化格式
            OutputFormat format = OutputFormat.createPrettyPrint();
            // 缩减格式
            //OutputFormat format = OutputFormat.createCompactFormat();*/
            // 指定XML编码
             format.setEncoding("UTF-8");
            xmlWriter = new XMLWriter(new FileWriter(xmlFile),format);
            xmlWriter.write(document);
            
        } catch (IOException e) {
        	e.printStackTrace();
        }finally{
        	try {
				xmlWriter.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
        }
     }
	
	public Document getDocument(File xmlFile) {   //取WEB-INF/classes目录下的xml文件
		SAXReader saxReader = new SAXReader();
		Document document = null;
		try {
			document = saxReader.read(xmlFile);
		} catch (DocumentException e) {
			e.printStackTrace();
		}
		return document;
	}
    
	public void addNode(Document document,String name,String text){
		Element root = document.getRootElement();
		Element element = root.addElement(name);
		element.setText(text);
	}
	
	public List<Element> getElementsByTag(Document document,String tagName){
		List<Element> list = document.selectNodes(tagName);
		return list;		
	}
	
	public int getTagCount(Document document,String tagName){
		List<Element> list = document.selectNodes(tagName);
		int count = list.size();
		return count;
	}
	
	public String getXmlByTag(Document document,String tagName){
		XMLUtil xmlUtil = new XMLUtil();
		List<Element> elements = document.selectNodes(tagName);
		Document newDocument = xmlUtil.createXML("root");
		Element root = newDocument.getRootElement();
		for(Element element:elements){
			root.addElement(element.getName())
			.addAttribute(element.attribute("id").getName(),element.attribute("id").getValue())
			.addAttribute(element.attribute("name").getName(),element.attribute("name").getValue());				
		}
		return newDocument.asXML();
	}
	
	public static void main(String[] args) {
		XMLUtil xmlUtil = new XMLUtil();
		Document document = xmlUtil.getDocument(new File("city.xml"));
		System.err.println(xmlUtil.getXmlByTag(document,"//province[@id=320000]//city[@id=320100]//area"));

	}

}
