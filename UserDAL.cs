using Dapper;
using MySql.Data.MySqlClient;
using QAFastTrack.Core.Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QAFastTrack.DAL
{
    public class UserDAL
    {
        public bool ManageUser(UserDE usr, MySqlCommand cmd = null)
        {
            bool closeConnectionFlag = false;
            try
            {
                if (cmd == null)
                {
                    cmd = QAFastTrackDataContext.OpenMySqlConnection();
                    closeConnectionFlag = true;
                }
                if (cmd.Connection.State == ConnectionState.Open)
                    Console.WriteLine("Connection  has been created");
                else
                    Console.WriteLine("Connection error");
                cmd.CommandText = "Manage_User";
                cmd.Parameters.AddWithValue("@prm_Id", usr.Id);
                cmd.Parameters.AddWithValue("@prm_Name", usr.Name);
                cmd.Parameters.AddWithValue("@prm_Email", usr.Email);
                cmd.Parameters.AddWithValue("@prm_CreatedBy", usr.CreatedById);
                cmd.Parameters.AddWithValue("@prm_CreatedOn", usr.CreatedOn);
                cmd.Parameters.AddWithValue("@prm_ModifiedBy", usr.ModifiedById);
                cmd.Parameters.AddWithValue("@prm_ModifiedOn", usr.ModifiedOn);
                cmd.Parameters.AddWithValue("@prm_IsActive", usr.IsActive);
                cmd.Parameters.AddWithValue("@prm_Filter", usr.DBoperation.ToString());
                //cmd.Parameters.AddWithValue("@prm_RetVal", 0);
                cmd.ExecuteNonQuery();

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
            finally
            {
                if (closeConnectionFlag)
                    QAFastTrackDataContext.CloseMySqlConnection(cmd);
            }
        }

        public List<UserDE> SearchUser(string whereClause, MySqlCommand cmd = null)
        {
            // string filter = "FreeSearch";
            List<UserDE> list = new List<UserDE>();
            bool closeConnectionFlag = false;
            try
            {
                if (cmd == null)
                {
                    cmd = QAFastTrackDataContext.OpenMySqlConnection();
                    closeConnectionFlag = true;
                }
                if (cmd.Connection.State == ConnectionState.Open)
                    Console.WriteLine("Connection  has been created");
                else
                    Console.WriteLine("Connection error");

                list = cmd.Connection.Query<UserDE>("call microerp.Get_User( '" + whereClause + "'  ) ").ToList();
                return list;
            }
            catch (Exception exp)
            {
                return list;
            }
            finally
            {
                if (closeConnectionFlag)
                    QAFastTrackDataContext.CloseMySqlConnection(cmd);
            }
        }

    }
}

