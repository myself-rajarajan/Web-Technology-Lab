<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <title>ATM Management System</title>
                <style>
                    table {
                        width: 100%;
                        border-collapse: collapse;
                    }
                    th, td {
                        border: 1px solid #ddd;
                        padding: 8px;
                        text-align: center;
                    }
                    th {
                        background-color: #f2f2f2;
                    }
                </style>
            </head>
            <body>
                <h2>ATM Management System Records</h2>
                <table>
                    <tr>
                        <th>ATM ID</th>
                        <th>Location</th>
                        <th>Bank Name</th>
                        <th>Currency Type</th>
                        <th>Max Withdrawal Amount</th>
                        <th>Min Balance</th>
                        <th>Last Maintenance Date</th>
                        <th>Status</th>
                        <th>Service Contact</th>
                        <th>Working Hours</th>
                    </tr>
                    <xsl:for-each select="ATMManagementSystem/ATM">
                        <xsl:if test="status='Active'">
                            <tr>
                                <td><xsl:value-of select="atmId" /></td>
                                <td><xsl:value-of select="location" /></td>
                                <td><xsl:value-of select="bankName" /></td>
                                <td><xsl:value-of select="currencyType" /></td>
                                <td><xsl:value-of select="maxWithdrawalAmount" /></td>
                                <td><xsl:value-of select="minBalance" /></td>
                                <td><xsl:value-of select="lastMaintenanceDate" /></td>
                                <td><xsl:value-of select="status" /></td>
                                <td><xsl:value-of select="serviceContact" /></td>
                                <td><xsl:value-of select="workingHours" /></td>
                            </tr>
                        </xsl:if>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
