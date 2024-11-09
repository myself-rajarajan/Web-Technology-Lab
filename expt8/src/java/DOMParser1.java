import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.*;

public class DOMParser1 {
    public static void main(String[] args) {
        try {
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            DocumentBuilder builder = factory.newDocumentBuilder();

            ClassLoader classLoader = DOMParser1.class.getClassLoader();
            Document document = builder.parse(classLoader.getResourceAsStream("newXMLDocument.xml"));

            document.getDocumentElement().normalize();

            System.out.println("Root element: " + document.getDocumentElement().getNodeName());

            NodeList nodeList = document.getElementsByTagName("employee");
            for (int i = 0; i < nodeList.getLength(); i++) {
                Node node = nodeList.item(i);
                if (node.getNodeType() == Node.ELEMENT_NODE) {
                    Element employee = (Element) node;
                    System.out.println("Employee ID: " + employee.getElementsByTagName("id").item(0).getTextContent());
                    System.out.println("Name: " + employee.getElementsByTagName("name").item(0).getTextContent());
                    System.out.println("Role: " + employee.getElementsByTagName("role").item(0).getTextContent());
                    System.out.println("Department: " + employee.getElementsByTagName("department").item(0).getTextContent());
                    System.out.println("Salary: $" + employee.getElementsByTagName("salary").item(0).getTextContent());
                    System.out.println();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
