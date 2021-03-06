USE [kalum_test]
GO
/****** Object:  Table [dbo].[ExamenAdmision]    Script Date: 9/07/2022 10:50:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamenAdmision](
	[ExamenId] [varchar](128) NOT NULL,
	[FechaExamen] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ExamenId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarreraTecnica]    Script Date: 9/07/2022 10:50:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarreraTecnica](
	[CarreraId] [varchar](128) NOT NULL,
	[Nombre] [varchar](128) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CarreraId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Aspirante]    Script Date: 9/07/2022 10:50:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aspirante](
	[NoExpediente] [varchar](128) NOT NULL,
	[Apellidos] [varchar](128) NOT NULL,
	[Nombres] [varchar](128) NOT NULL,
	[Direccion] [varchar](128) NOT NULL,
	[Telefono] [varchar](64) NOT NULL,
	[Email] [varchar](128) NOT NULL,
	[Estatus] [varchar](32) NULL,
	[CarreraId] [varchar](128) NOT NULL,
	[ExamenId] [varchar](128) NOT NULL,
	[JornadaId] [varchar](128) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[NoExpediente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Consulta]    Script Date: 9/07/2022 10:50:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Consulta] as
	select NoExpediente, Apellidos, Nombres,CarreraTecnica, FechaExamen from Aspirante a 
	inner join ExamenAdmision ea on a.ExamenId = ea.ExamenId
	inner join CarreraTecnica ct on a.CarreraId = ct.CarreraId
	where ea.FechaExamen = '2022-30-04'
GO
/****** Object:  View [dbo].[ConsultaAspirantes]    Script Date: 9/07/2022 10:50:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[ConsultaAspirantes] as
	select NoExpediente, Apellidos, Nombres,CarreraTecnica, FechaExamen from Aspirante a 
	inner join ExamenAdmision ea on a.ExamenId = ea.ExamenId
	inner join CarreraTecnica ct on a.CarreraId = ct.CarreraId
GO
/****** Object:  Table [dbo].[Alumno]    Script Date: 9/07/2022 10:50:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alumno](
	[Carne] [varchar](8) NOT NULL,
	[Apellidos] [varchar](128) NOT NULL,
	[Nombres] [varchar](128) NOT NULL,
	[Direccion] [varchar](128) NOT NULL,
	[Telefono] [varchar](64) NOT NULL,
	[Email] [varchar](64) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Carne] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cargo]    Script Date: 9/07/2022 10:50:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cargo](
	[CargoId] [varchar](128) NOT NULL,
	[Descripcion] [varchar](128) NOT NULL,
	[Prefijo] [varchar](64) NOT NULL,
	[Monto] [decimal](10, 2) NOT NULL,
	[GeneraMora] [bit] NOT NULL,
	[PorcentajeMora] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CargoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CuentaPorCobrar]    Script Date: 9/07/2022 10:50:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CuentaPorCobrar](
	[Cargo] [varchar](128) NOT NULL,
	[Carne] [varchar](8) NOT NULL,
	[CargoId] [varchar](128) NOT NULL,
	[Anio] [varchar](4) NOT NULL,
	[Descripcion] [varchar](128) NOT NULL,
	[FechaCargo] [datetime] NOT NULL,
	[FechaAplica] [datetime] NOT NULL,
	[Monto] [decimal](10, 2) NOT NULL,
	[Mora] [decimal](10, 2) NOT NULL,
	[Descuento] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_CuentaPorCobrar_Cargo] PRIMARY KEY CLUSTERED 
(
	[Cargo] ASC,
	[Carne] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inscripcion]    Script Date: 9/07/2022 10:50:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inscripcion](
	[InscripcionId] [varchar](128) NOT NULL,
	[Carne] [varchar](8) NOT NULL,
	[CarreraId] [varchar](128) NOT NULL,
	[JornadaId] [varchar](128) NOT NULL,
	[Ciclo] [varchar](4) NOT NULL,
	[FechaInscripcion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[InscripcionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InscripcionPago]    Script Date: 9/07/2022 10:50:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InscripcionPago](
	[BoletaPago] [varchar](128) NOT NULL,
	[Anio] [varchar](4) NOT NULL,
	[NoExpediente] [varchar](128) NOT NULL,
	[FechaPago] [datetime] NOT NULL,
	[Monto] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK__Inscripc__D17F09F3F2108B99] PRIMARY KEY CLUSTERED 
(
	[BoletaPago] ASC,
	[Anio] ASC,
	[NoExpediente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InversionCarreraTecnica]    Script Date: 9/07/2022 10:50:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InversionCarreraTecnica](
	[InversionId] [varchar](128) NOT NULL,
	[CarreraId] [varchar](128) NOT NULL,
	[MontoInscripcion] [decimal](10, 2) NOT NULL,
	[NumeroPagos] [int] NOT NULL,
	[MontoPagos] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[InversionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Jornada]    Script Date: 9/07/2022 10:50:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jornada](
	[JornadaId] [varchar](128) NOT NULL,
	[jornada] [varchar](2) NOT NULL,
	[Descripcion] [varchar](128) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[JornadaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ResultadoExamenAdmision]    Script Date: 9/07/2022 10:50:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResultadoExamenAdmision](
	[NoExpediente] [varchar](128) NOT NULL,
	[Anio] [varchar](4) NOT NULL,
	[Descripcion] [varchar](128) NOT NULL,
	[Nota] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[NoExpediente] ASC,
	[Anio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Aspirante] ADD  DEFAULT ('NO ASIGNADO') FOR [Estatus]
GO
ALTER TABLE [dbo].[ResultadoExamenAdmision] ADD  DEFAULT ((0)) FOR [Nota]
GO
ALTER TABLE [dbo].[Aspirante]  WITH CHECK ADD  CONSTRAINT [FK_ASPIRANTE_CARRERA_TECNICA] FOREIGN KEY([CarreraId])
REFERENCES [dbo].[CarreraTecnica] ([CarreraId])
GO
ALTER TABLE [dbo].[Aspirante] CHECK CONSTRAINT [FK_ASPIRANTE_CARRERA_TECNICA]
GO
ALTER TABLE [dbo].[Aspirante]  WITH CHECK ADD  CONSTRAINT [FK_ASPIRANTE_EXAMEN_ADMISION] FOREIGN KEY([ExamenId])
REFERENCES [dbo].[ExamenAdmision] ([ExamenId])
GO
ALTER TABLE [dbo].[Aspirante] CHECK CONSTRAINT [FK_ASPIRANTE_EXAMEN_ADMISION]
GO
ALTER TABLE [dbo].[Aspirante]  WITH CHECK ADD  CONSTRAINT [FK_ASPIRANTE_JORNADA] FOREIGN KEY([JornadaId])
REFERENCES [dbo].[Jornada] ([JornadaId])
GO
ALTER TABLE [dbo].[Aspirante] CHECK CONSTRAINT [FK_ASPIRANTE_JORNADA]
GO
ALTER TABLE [dbo].[CuentaPorCobrar]  WITH NOCHECK ADD  CONSTRAINT [FK_CuentaPorCobrar_Alumno] FOREIGN KEY([Carne])
REFERENCES [dbo].[Alumno] ([Carne])
GO
ALTER TABLE [dbo].[CuentaPorCobrar] CHECK CONSTRAINT [FK_CuentaPorCobrar_Alumno]
GO
ALTER TABLE [dbo].[CuentaPorCobrar]  WITH NOCHECK ADD  CONSTRAINT [FK_CuentaPorCobrar_Cargo] FOREIGN KEY([CargoId])
REFERENCES [dbo].[Cargo] ([CargoId])
GO
ALTER TABLE [dbo].[CuentaPorCobrar] CHECK CONSTRAINT [FK_CuentaPorCobrar_Cargo]
GO
ALTER TABLE [dbo].[Inscripcion]  WITH CHECK ADD  CONSTRAINT [FK_INSCRIPCION_ALUMNO] FOREIGN KEY([Carne])
REFERENCES [dbo].[Alumno] ([Carne])
GO
ALTER TABLE [dbo].[Inscripcion] CHECK CONSTRAINT [FK_INSCRIPCION_ALUMNO]
GO
ALTER TABLE [dbo].[Inscripcion]  WITH CHECK ADD  CONSTRAINT [FK_INSCRIPCION_CARRERA_TECNICA] FOREIGN KEY([CarreraId])
REFERENCES [dbo].[CarreraTecnica] ([CarreraId])
GO
ALTER TABLE [dbo].[Inscripcion] CHECK CONSTRAINT [FK_INSCRIPCION_CARRERA_TECNICA]
GO
ALTER TABLE [dbo].[Inscripcion]  WITH CHECK ADD  CONSTRAINT [FK_INSCRIPCION_JORNADA] FOREIGN KEY([JornadaId])
REFERENCES [dbo].[Jornada] ([JornadaId])
GO
ALTER TABLE [dbo].[Inscripcion] CHECK CONSTRAINT [FK_INSCRIPCION_JORNADA]
GO
ALTER TABLE [dbo].[InscripcionPago]  WITH CHECK ADD  CONSTRAINT [FK_INSCRIPCION_PAGO_ASPIRANTE] FOREIGN KEY([NoExpediente])
REFERENCES [dbo].[Aspirante] ([NoExpediente])
GO
ALTER TABLE [dbo].[InscripcionPago] CHECK CONSTRAINT [FK_INSCRIPCION_PAGO_ASPIRANTE]
GO
ALTER TABLE [dbo].[InversionCarreraTecnica]  WITH CHECK ADD  CONSTRAINT [FK_INVERSION_CARRERA_TECNICA] FOREIGN KEY([CarreraId])
REFERENCES [dbo].[CarreraTecnica] ([CarreraId])
GO
ALTER TABLE [dbo].[InversionCarreraTecnica] CHECK CONSTRAINT [FK_INVERSION_CARRERA_TECNICA]
GO
ALTER TABLE [dbo].[ResultadoExamenAdmision]  WITH CHECK ADD  CONSTRAINT [FK_RESULTADO_EXAMEN_ADMISION_ASPIRANTE] FOREIGN KEY([NoExpediente])
REFERENCES [dbo].[Aspirante] ([NoExpediente])
GO
ALTER TABLE [dbo].[ResultadoExamenAdmision] CHECK CONSTRAINT [FK_RESULTADO_EXAMEN_ADMISION_ASPIRANTE]
GO
/****** Object:  StoredProcedure [dbo].[sp_EnrollmentProcess]    Script Date: 9/07/2022 10:50:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_EnrollmentProcess] @NoExpediente varchar(12), @Ciclo varchar(4), @MesInicioPago int, @CarreraId varchar(128)
as
begin
	-- Variables Para Informacion general de aspirantes
	declare @Apellidos varchar(128)
	declare @Nombres varchar(128)
	declare @Direccion varchar(128)
	declare @Telefono varchar(64)
	declare @Email varchar(64)
	declare @JornadaId varchar(128)
	-- Variable para generar numero de carne
	declare @Exists int
	declare @Carne varchar(12)
	-- Variable para el proceso de pago
	declare @MontoInscripcion numeric(10,2)
	declare @NumeroPagos int
	declare @MontoPago numeric(10,2)
	declare @Descripcion varchar(128)
	declare @Prefijo varchar(6)
	declare @CargoId varchar(128)
	declare @Monto numeric(10,2)
	declare @CorrelativoPagos int
	-- Inicio de transaccion
	begin transaction
	begin try
		select @Apellidos = Apellidos, 
			   @Nombres = Nombres,
			   @Direccion = Direccion,
			   @Telefono = Telefono,
			   @Email = Email,
			   @JornadaId = JornadaId 
			   from Aspirante where NoExpediente = @NoExpediente
			   set @Exists = (select top 1 Alumno.Carne from Alumno where SUBSTRING(Alumno.Carne,1,4) = @Ciclo ORDER by Alumno.Carne DESC)
			   if @Exists is null
			   Begin
				set @Carne = (@Ciclo * 10000) + 1
			   End
			   Else
			   Begin
				set @Carne = (select top 1 Alumno.Carne from Alumno where SUBSTRING(Alumno.Carne,1,4) = @Ciclo ORDER by Alumno.Carne DESC) + 1
				-- set@Carne = @Exists + 1
			   End
			   --Proceso de Inscripcion
			   insert into Alumno values(@Carne, @Apellidos,@Nombres,@Direccion,@Telefono,CONCAT(@Carne,@Email))
			   insert into Inscripcion values(newid(),@Carne,@CarreraId,@JornadaId,@Ciclo,getdate())
			   update Aspirante set Estatus = 'INSCRITO CICLO' + @Ciclo  where NoExpediente = @NoExpediente
			   
			   --Proceso de Cargos
			   --Cargo de Inscripcion
			   select @MontoInscripcion = MontoInscripcion,
				      @NumeroPagos = NumeroPagos,
					  @MontoPago = MontoPagos
			   from   InversionCarreraTecnica ict 
			   where  ict.CarreraId = @CarreraId

			   select @CargoId = CargoId,
					  @Descripcion = Descripcion,
					  @Prefijo = Prefijo
			   from  Cargo c2 
			   where c2.CargoId = '654B1394-CA15-4DFE-AE8E-D04659C11683'

			   insert into CuentaPorCobrar 
			   values
			   (
					CONCAT(@Prefijo,SUBSTRING(@Ciclo,3,2),dbo.LPAD('1',2,'0')),@Carne,@CargoId,@Ciclo,@Descripcion,GETDATE(),GETDATE(),@MontoInscripcion,0,0
			   )
			   --Cargo de pago de Carné
			   select @CargoId = CargoId, @Descripcion = Descripcion, @Prefijo = Prefijo, @Monto = Monto
			   from Cargo c2 where c2.CargoId = 'CF517F3F-2C41-4B47-B0D3-DBA1A58831D8'
			   insert into CuentaPorCobrar
			   values(concat(@Prefijo,SUBSTRING(@Ciclo,3,2),dbo.LPAD('1',2,'0')),@Carne, @CargoId, @Ciclo, @Descripcion, GETDATE(),GETDATE(),@Monto,0,0)
	
			   --Cargos Mensuales
			   set @CorrelativoPagos = 1
			   select @CargoId = CargoId, @Descripcion=Descripcion, @Prefijo = Prefijo from Cargo c2 where c2.CargoId = 'FB80A8B4-BCE6-455D-BAA5-3CFACDF26F75'
			   while(@CorrelativoPagos <= @NumeroPagos)
			   begin
					insert into CuentaPorCobrar
					values(concat(@Prefijo,SUBSTRING(@Ciclo,3,2),dbo.LPAD(@CorrelativoPagos,2,'0')),@Carne, @CargoId, @Ciclo, @Descripcion, GETDATE(),concat(@Ciclo,'-',dbo.LPAD(@MesInicioPago,2,'0'),'-','05'),@MontoPago,0,0)
					set @CorrelativoPagos = @CorrelativoPagos + 1
					set @MesInicioPago = @MesInicioPago + 1
			   end
			
		commit transaction
		select 'TRANSACTION SUCCESS' as status, @Carne as carne
	end try
	
	begin catch
		/*SELECT
            ERROR_NUMBER() AS ErrorNumber
            ,ERROR_SEVERITY() AS ErrorSeverity
            ,ERROR_STATE() AS ErrorState
            ,ERROR_PROCEDURE() AS ErrorProcedure
            ,ERROR_LINE() AS ErrorLine
            ,ERROR_MESSAGE() AS ErrorMessage;*/
		rollback transaction
		select 'TRANSACTION ERROR' as status, 0 as carne
	end catch
end

GO
