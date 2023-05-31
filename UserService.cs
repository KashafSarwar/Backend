using MySql.Data.MySqlClient;
using QAFastTrack.Core.Entities;
using QAFastTrack.Core.Enums;
using QAFastTrack.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QAFastTrack.Service
{
    public class UserService
    {
        private UserDAL _usrDAL;
        private CoreDAL _corDAL;


        public UserService()
        {
            _usrDAL = new UserDAL();
            _corDAL = new CoreDAL();
        }
        public bool ManageUser(UserDE mod)
        {
            // class veriables/datamembers


            MySqlCommand cmd = null;
            try
            {
                bool check = true;
                cmd = QAFastTrackDataContext.OpenMySqlConnection();
                QAFastTrackDataContext.StartTransaction(cmd);

                if (mod.DBoperation == DBoperations.Insert)
                {
                    mod.Id = _corDAL.GetnextId(TableNames.User.ToString());
                    //if (mod.Id == 1)
                    //   mod.Id = 1001;
                    check = _usrDAL.ManageUser(mod);
                }
                else if (mod.DBoperation == DBoperations.Update)
                {
                    check = _usrDAL.ManageUser(mod);
                }
                else if (mod.DBoperation == DBoperations.Delete)
                {
                    check = _usrDAL.ManageUser(mod);
                }
                //else if (mod.DBoperation == DBoperations.Activate)
                //{
                //    check = _taskDAL.AlterTask(mod);
                //}
                //else if (mod.DBoperation == DBoperations.DeActivate)
                //{
                //    check = _taskDAL.AlterTask(mod);
                //}
                //if (check == true)
                //    mod.DBoperation = DBoperations.NA;

                QAFastTrackDataContext.EndTransaction(cmd);
            }
            catch
            {
                QAFastTrackDataContext.CancelTransaction(cmd);
            }
            finally
            {
                if (cmd != null)
                    QAFastTrackDataContext.CloseMySqlConnection(cmd);
            }
            return true;

        }





        //public List<MircroERP.Core.Entities.WMS.DE> SearchCourses(CourseSearchCriteria search)
        //{
        //    throw new NotImplementedException();
        //}

        //public List<CourseDE> SearchCourses(CourseSearchCriteria mod)
        public List<UserDE> SearchUser()
        {
            List<UserDE> list = new List<UserDE>();
            bool closeConnectionFlag = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = QAFastTrackDataContext.OpenMySqlConnection();
                QAFastTrackDataContext.StartTransaction(cmd);

                #region Search

                string whereClause;
                //if (mod.FreeSearch == null)
                //{
                //    whereClause = "where 1=1";
                //    if (mod.Id != default)
                //        whereClause += $" AND Id={mod.Id}";
                //    if (mod.IsActive != default)
                //        whereClause += $" AND IsActive={mod.IsActive}";
                //    if (mod.UserId != default)
                //        whereClause += $" AND UserId={mod.UserId}";
                //    if (mod.ModuleId != default)
                //        whereClause += $" AND ModuleId={mod.ModuleId}";
                //    if (mod.StatusId != default)
                //        whereClause += $" AND StatusId={mod.StatusId}";
                //    if (mod.User != default)
                //        whereClause += $" AND User like ''{mod.User}''";
                //    if (mod.Module != default)
                //        whereClause += $" AND Module like ''{mod.Module}''";
                //    if (mod.Status != default)
                //        whereClause += $" AND Status like ''{mod.Status}''";
                //    if (mod.SP != default)
                //        whereClause += $" AND SP={mod.SP}";
                //    if (mod.Title != default)
                //    {
                //        if (mod.Title != "")
                //            whereClause += $" AND Title like ''{mod.Title}''";
                //    }
                //    if (mod.Description != default)
                //    {
                //        if (mod.Description != "")
                //            whereClause += $" AND Description like ''{mod.Description}''";
                //    }
                //}
                //else
                //{
                //    whereClause = "";
                //    //whereClause += $" Where Module like ''{mod.FreeSearch}''";
                //    whereClause += $" Where TaskStatus like ''{mod.FreeSearch}''";
                //    whereClause += $" OR Id like ''{mod.FreeSearch}''";
                //    whereClause += $" OR User like ''{mod.FreeSearch}''";
                //    whereClause += $" OR Description like ''{mod.FreeSearch}''";
                //    whereClause += $" OR Title like ''{mod.FreeSearch}''";
                //    whereClause += $" OR SP like ''{mod.FreeSearch}''";
                //}
                list = _usrDAL.SearchUser("");

                #endregion

                QAFastTrackDataContext.EndTransaction(cmd);
            }
            catch (Exception exp)
            {
                QAFastTrackDataContext.CancelTransaction(cmd);
                throw exp;
            }
            finally
            {
                if (closeConnectionFlag)
                    QAFastTrackDataContext.CloseMySqlConnection(cmd);
            }
            return list;
        }
    }
}
    