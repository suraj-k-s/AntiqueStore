package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("    <head>\n");
      out.write("        <title>Antique Store</title>\n");
      out.write("        <meta charset=\"utf-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\n");
      out.write("\n");
      out.write("        <link href=\"https://fonts.googleapis.com/css2?family=Spectral:ital,wght@0,200;0,300;0,400;0,500;0,700;0,800;1,200;1,300;1,400;1,500;1,700&display=swap\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/Assets/Template/css/font-awesome.min.css\">\n");
      out.write("\n");
      out.write("        <link rel=\"stylesheet\" href=\"Assets/Template/css/animate.css\">\n");
      out.write("\n");
      out.write("        <link rel=\"stylesheet\" href=\"Assets/Template/css/owl.carousel.min.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"Assets/Template/css/owl.theme.default.min.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"Assets/Template/css/magnific-popup.css\">\n");
      out.write("\n");
      out.write("        <link rel=\"stylesheet\" href=\"Assets/Template/css/flaticon.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"Assets/Template/css/style.css\">\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <nav class=\"navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light\" id=\"ftco-navbar\">\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <a class=\"navbar-brand\" href=\"index.html\">Antique <span>Store</span></a>\n");
      out.write("\n");
      out.write("                <div class=\"collapse navbar-collapse\" id=\"ftco-nav\">\n");
      out.write("                    <ul class=\"navbar-nav ml-auto\">\n");
      out.write("                        <li class=\"nav-item active\"><a href=\"index.jsp\" class=\"nav-link\">Home</a></li>\n");
      out.write("                        <li class=\"nav-item dropdown\">\n");
      out.write("                            <a class=\"nav-link dropdown-toggle\" href=\"#\" id=\"dropdown04\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">Registration</a>\n");
      out.write("                            <div class=\"dropdown-menu\" aria-labelledby=\"dropdown04\">\n");
      out.write("                                <a class=\"dropdown-item\" href=\"Guest/Antiqueshopregistration.jsp\">Antique Shop</a>\n");
      out.write("                                <a class=\"dropdown-item\" href=\"Guest/Customerregistration.jsp\">Customer</a>\n");
      out.write("                            </div>\n");
      out.write("                        </li>\n");
      out.write("                        <li class=\"nav-item\"><a href=\"Guest/Login.jsp\" class=\"nav-link\">Login</a></li>\n");
      out.write("                    </ul>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </nav>\n");
      out.write("        <div class=\"hero-wrap\" style=\"background-image: url('Assets/Template/Antique Palace.jpg');\" data-stellar-background-ratio=\"0.5\">\n");
      out.write("            <div class=\"overlay\"></div>\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <div class=\"row no-gutters slider-text align-items-center justify-content-center\">\n");
      out.write("                    <div class=\"col-md-8 ftco-animate d-flex align-items-end\">\n");
      out.write("                        <div class=\"text w-100 text-center\">\n");
      out.write("                            <h1 class=\"mb-4\"><span>Never Dying Trends</span>.</h1>\n");
      out.write("                            <p><a href=\"Guest/Login.jsp\" class=\"btn btn-primary py-2 px-4\">Explore Now</a></p>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("        <!-- loader -->\n");
      out.write("\n");
      out.write("\n");
      out.write("        <script src=\"Assets/Template/js/jquery.min.js\"></script>\n");
      out.write("        <script src=\"Assets/Template/js/jquery-migrate-3.0.1.min.js\"></script>\n");
      out.write("        <script src=\"Assets/Template/js/popper.min.js\"></script>\n");
      out.write("        <script src=\"Assets/Template/js/bootstrap.min.js\"></script>\n");
      out.write("        <script src=\"Assets/Template/js/jquery.easing.1.3.js\"></script>\n");
      out.write("        <script src=\"Assets/Template/js/jquery.waypoints.min.js\"></script>\n");
      out.write("        <script src=\"Assets/Template/js/jquery.stellar.min.js\"></script>\n");
      out.write("        <script src=\"Assets/Template/js/owl.carousel.min.js\"></script>\n");
      out.write("        <script src=\"Assets/Template/js/jquery.magnific-popup.min.js\"></script>\n");
      out.write("        <script src=\"Assets/Template/js/jquery.animateNumber.min.js\"></script>\n");
      out.write("        <script src=\"Assets/Template/js/scrollax.min.js\"></script>\n");
      out.write("        <script src=\"https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false\"></script>\n");
      out.write("        <script src=\"Assets/Template/js/google-map.js\"></script>\n");
      out.write("        <script src=\"Assets/Template/js/main.js\"></script>\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
