import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import java.io.InputStream;

public class SAXParser1 {
    public static void main(String[] args) {
        try {
            SAXParserFactory factory = SAXParserFactory.newInstance();
            SAXParser saxParser = factory.newSAXParser();

            DefaultHandler handler = new DefaultHandler() {
                boolean bId = false;
                boolean bName = false;
                boolean bRole = false;
                boolean bDepartment = false;
                boolean bSalary = false;

                public void startElement(String uri, String localName, String qName, Attributes attributes) throws SAXException {
                    switch (qName) {
                        case "id" -> bId = true;
                        case "name" -> bName = true;
                        case "role" -> bRole = true;
                        case "department" -> bDepartment = true;
                        case "salary" -> bSalary = true;
                    }
                }

                public void characters(char[] ch, int start, int length) throws SAXException {
                    if (bId) {
                        System.out.println("Employee ID: " + new String(ch, start, length));
                        bId = false;
                    } else if (bName) {
                        System.out.println("Name: " + new String(ch, start, length));
                        bName = false;
                    } else if (bRole) {
                        System.out.println("Role: " + new String(ch, start, length));
                        bRole = false;
                    } else if (bDepartment) {
                        System.out.println("Department: " + new String(ch, start, length));
                        bDepartment = false;
                    } else if (bSalary) {
                        System.out.println("Salary: $" + new String(ch, start, length));
                        bSalary = false;
                    }
                }

                public void endElement(String uri, String localName, String qName) throws SAXException {
                    if (qName.equalsIgnoreCase("employee")) {
                        System.out.println();
                    }
                }
            };

            InputStream xmlInput = SAXParser1.class.getClassLoader().getResourceAsStream("newXMLDocument.xml");
            if (xmlInput == null) {
                throw new IllegalArgumentException("File not found!");
            }
            saxParser.parse(xmlInput, handler);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

