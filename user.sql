CREATE TABLE `User` (
  `Id` int NOT NULL,
  `Name` Varchar(50) NOT NULL,
 `Email`Varchar(50) NOT NULL,
  `CreatedBy` int DEFAULT NULL,
  `CreatedOn` datetime DEFAULT NULL,
  `ModifiedBy` int DEFAULT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `IsActive` bit(1) DEFAULT NULL
);

-- craete manage procedure--

drop procedure if exists `Manage_User`;
delimiter ;;
create procedure `Manage_User`( In prm_Filter varchar (50),
In prm_Id int ,
  In prm_Name  Varchar(50),
  In prm_Email Varchar(50) ,
  IN prm_CreatedBy INT,
  IN prm_CreatedOn datetime ( 0 ),
  IN prm_ModifiedBy INT,
  IN prm_ModifiedOn datetime ( 0 ),
  In prm_IsActive bit ( 1 )
  
 -- OUT prm_RetVal INT
 )
BEGIN

	

	-- SET prm_RetVal =- 1;

	IF

		( prm_Filter = 'Insert' ) THEN

		BEGIN

			insert into User (Id, Name, Email, CreatedBy, CreatedOn, IsActive) 
			values (prm_Id, prm_Name, prm_Email, prm_CreatedBy, prm_CreatedOn, prm_IsActive );

			-- SET prm_RetVal = LAST_INSERT_ID();

		END;

		ELSE

		IF

			( prm_Filter = 'Update' ) THEN

			BEGIN

				Update User
				Set 
				Name = prm_Name,
               Email = prm_Email,
              ModifiedBy = prm_ModifiedBy,
				ModifiedOn = prm_ModifiedOn,
				IsActive = prm_IsActive
				Where Id = prm_Id;

				-- SET prm_RetVal = prm_Id;

			END;

			ELSE

			IF

				( prm_Filter = 'Delete' ) THEN

				BEGIN

					DELETE FROM `User` 
					WHERE Id = prm_Id;

					-- SET prm_RetVal = prm_Id;

				END;

				ELSE

				IF

					( prm_Filter = 'Disable' ) THEN

					BEGIN

							UPDATE `User` 

							SET IsActive = 0,

							ModifiedBy = prm_ModifiedBy,

							ModifiedOn = prm_ModifiedOn 

						WHERE

							Id = prm_Id;

					-- 	SET prm_RetVal = prm_Id;

					END;

				END IF;

			END IF;

		END IF;

	END IF;

END;

-- create get procedure--


DROP PROCEDURE IF EXISTS `Get_User`;
delimiter ;;

CREATE PROCEDURE `Get_User`(prm_WhereClause VARCHAR ( 2000 ))
BEGIN 

	

		BEGIN

			DECLARE

				offsetVal INT DEFAULT 0;

			

			SET @QueryStr = "SELECT Count(usr.Id) INTO @TotalRecords
													FROM User as usr
													";

			

			SET @QueryStr = CONCAT( @QueryStr, prm_WhereClause );

			PREPARE stmt1 

			FROM

				@QueryStr;

			EXECUTE stmt1;

			DEALLOCATE PREPARE stmt1;


					

					

	SET @QueryStr = "SELECT 	
    usr.Id AS Id, 
		usr.Name, 
        usr.Email, 
       usr.CreatedOn,
		-- Func_Get_FullName(crs.CreatedBy) As CreatedName,
        usr.CreatedBy,
		usr.ModifiedOn,
		-- Func_Get_FullName(crs.ModifiedBy) As ModifiedName,
        usr.ModifiedBy,
		usr.IsActive
FROM
		User AS usr;
";

			
			SET @QueryStr = CONCAT( @QueryStr, prm_WhereClause );

			PREPARE stmt1 

			FROM

				@QueryStr;

			EXECUTE stmt1;

			DEALLOCATE PREPARE stmt1;

			SELECT

				@querystr;

		END;


END;

select*from User;

