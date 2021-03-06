﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataTransferObject;
using System.Data;
using System.Data.SqlClient;

namespace DataAccessLayer
{
    public class DUAN_DAL
    {

        public static List<DUAN_DTO> LoadComboBoxDuAn(){
            try
            {
                List<DUAN_DTO> lstDuAn = new List<DUAN_DTO>();
                SqlConnection db = DataProvider.dbContext;
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "LoadComboBoxDuAn";
                cmd.Connection = db;
                SqlDataReader reader = cmd.ExecuteReader();// goi den storeprocedure de lay du lieu

                while (reader.Read())// dua du lieu vao lstNhanVien
                {
                    DUAN_DTO daDTO = new DUAN_DTO();
                    daDTO.MaDA = int.Parse(reader["MaDA"].ToString());
                    daDTO.TenDA = reader["TenDA"].ToString();
                    daDTO.MaPB = int.Parse(reader["MaPB"].ToString());
                    daDTO.DiaDiem = reader["Diadiem"].ToString();
                    lstDuAn.Add(daDTO);
                }
                reader.Close();
                return lstDuAn;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public static List<DUAN_DTO> LoadTatCaDuAn()
        {
            try
            {
                List<DUAN_DTO> lstDuAn = new List<DUAN_DTO>();
                SqlConnection db = DataProvider.dbContext;// ket noi den csdl
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "LoadAllDuAn";
                cmd.Connection = db;
                SqlDataReader reader = cmd.ExecuteReader();// goi den storeprocedure de lay du lieu

                while (reader.Read())// dua du lieu vao lstNhanVien
                {
                    DUAN_DTO daDTO = new DUAN_DTO();
                    daDTO.MaDA = int.Parse(reader["MaDA"].ToString());
                    daDTO.TenDA = reader["TenDA"].ToString();
                    daDTO.MaPB = int.Parse(reader["MaPB"].ToString());
                    daDTO.DiaDiem = reader["Diadiem"].ToString();
                    lstDuAn.Add(daDTO);
                }
                reader.Close();
                return lstDuAn;
            }
            catch (Exception ex)
            {
                return null;
            }
        }


        public static int CapNhatDuAn(DUAN_DTO daDTO)
        {
            try
            {
                if (daDTO.MaDA == 0)
                {
                    SqlConnection db = DataProvider.dbContext;
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "INSERT INTO DUAN (TenDA, DiaDiem,MaPB)" +
                                      " VALUES ("
                                       + " N'" + daDTO.TenDA + "', " + " N'" + daDTO.DiaDiem + "', " + daDTO.MaPB + " )";
                    cmd.Connection = db;
                    return cmd.ExecuteNonQuery();
                }
                else
                {
                    SqlConnection db = DataProvider.dbContext;
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "UPDATE DUAN SET  " +
                                      "TenDA= N'" + daDTO.TenDA + "', " +
                                      "DiaDiem = '" + daDTO.DiaDiem + "', " +
                                      "MaPB = " + daDTO.MaPB + " where MaDA= " + daDTO.MaDA;
                    cmd.Connection = db;
                    return cmd.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                return -1;
            }

        }
        public static List<DUAN_DTO> TimKiemDuAn(string searchStr)
        {
            try
            {
                List<DUAN_DTO> lstDuAn = new List<DUAN_DTO>();
                SqlConnection db = DataProvider.dbContext;
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "SELECT * " +
                                  "FROM DUAN as d " +
                                  "WHERE d.TenDA LIKE " + "N'%" + searchStr + "%'";
                //cmd.Parameters.Add("@HoTen", SqlDbType.NVarChar).Value = searchStr;
                cmd.Connection = db;
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    int MaPB;
                    DUAN_DTO daDTO = new DUAN_DTO();
                    daDTO.MaDA = int.Parse(reader["MaDA"].ToString());
                    daDTO.TenDA = reader["TenDA"].ToString();
                    daDTO.MaPB = int.TryParse(reader["MaPB"].ToString(), out MaPB) == true ? MaPB : 0;
                    daDTO.DiaDiem= reader["DiaDiem"].ToString();
                    lstDuAn.Add(daDTO);
                }
                reader.Close();
                return lstDuAn;
            }
            catch (Exception ex)
            {
                return null;
            }
        }


        public static int XoaDuAn(int MaDA)
        {
            try
            {
                SqlConnection db = DataProvider.dbContext;
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "XoaDuAnTheoMa";
                cmd.Parameters.Add("@maDA", SqlDbType.Int).Value = MaDA;
                cmd.Connection = db;
                return cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                return -1;
            }
        }

    }
}




