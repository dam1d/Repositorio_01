<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" encoding="utf-8"/>
  <xsl:template match="/">
    <html>
      <xsl:apply-templates/>
    </html>
  </xsl:template>
  <xsl:template match="toenda">
    <head>
      <title>ejer_16 :D:D:D</title>
    </head>
    <body>
      <h1>
        <xsl:value-of select="nombre"/>
      </h1>
      <h2>Teléfono: <xsl:value-of select="telefono"/> </h2>
      <xsl:for-each select="url">
        <xsl:value-of select="@etiqueta"/>
        <a>
          <xsl:attribute name="href">
            <xsl:value-of select="@prefijo"/>
            <xsl:value-of select="."/>
          </xsl:attribute>
          <xsl:value-of select="."/>
        </a>
        <br/>
      </xsl:for-each>
      <h2>Nuestros mejores productos </h2>
      <table border="1" borderwidth="2">
        <tr>
          <th>Código</th>
          <th>Existencias</th>
          <th>Artículo</th>
          <th>Sección</th>
          <th>Marca</th>
          <th>Modelo</th>
          <th>Características</th>
          <th colspan="2">Opciones</th>
          <th>Precio</th>
        </tr>
        <xsl:apply-templates select="producto"/>
      </table>
    </body>
  </xsl:template>
  <xsl:template match="producto">
    <tr>
      <xsl:apply-templates/>
    </tr>
  </xsl:template>
  <xsl:template match="codigo|cantidad|articulo|seccion|marca">
    <td>
      <xsl:text>&#160;</xsl:text>
      <xsl:value-of select="."/>
      <xsl:text>&#160;</xsl:text>
    </td>
  </xsl:template>
  <xsl:template match="modelo">
    <td>
      <xsl:text>&#160;</xsl:text>
      <xsl:value-of select="."/>
      <xsl:text>&#160;</xsl:text>
    </td>
    <xsl:if test="count(following-sibling::caracteristicas)=0">
      <td><xsl:text>&#160;</xsl:text></td>
    </xsl:if>
  </xsl:template> 
  <xsl:template match="caracteristicas">
    <td>
      <ul>
        <xsl:for-each select="linea">
          <li>
            <xsl:value-of select="."/>
          </li>
        </xsl:for-each>
      </ul>
    </td>
    <xsl:choose>
      <xsl:when test="count(following-sibling::opciones)=1">
        <td><xsl:text>&#160;</xsl:text></td>
      </xsl:when>
      <xsl:when test="count(following-sibling::opciones)=0">
        <td><xsl:text>&#160;</xsl:text></td>
        <td><xsl:text>&#160;</xsl:text></td>
      </xsl:when>
    </xsl:choose>
  </xsl:template>
  <xsl:template match="opciones">
    <td>
      <xsl:text>&#160;</xsl:text>
      <xsl:value-of select="@nombre"/>
      <xsl:text>:&#160;</xsl:text>
      <xsl:choose>
        <xsl:when test="@tipo=&quot;unica&quot;">
          <select>
            <xsl:for-each select="opcion">
              <option>
                <xsl:value-of select="@valor"/>
              </option>
            </xsl:for-each>
          </select>
        </xsl:when>
        <xsl:when test="@tipo=&quot;si_no&quot;">
          <xsl:value-of select="opcion/@valor"/>
          <xsl:text>&#160;</xsl:text>
          <input type="checkbox"/>
        </xsl:when>
      </xsl:choose>
      <xsl:text>&#160;</xsl:text>
    </td>
  </xsl:template>
  <xsl:template match="precio">
    <td>
      <xsl:text>&#160;</xsl:text>
      Precio:
      <xsl:value-of select="."/>
      <xsl:text>&#160;</xsl:text>
      <xsl:value-of select="@moneda"/>
      <xsl:text>s</xsl:text>
    </td>
  </xsl:template>
</xsl:stylesheet>
