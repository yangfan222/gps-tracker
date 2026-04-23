import { IsString, IsOptional } from 'class-validator';

export class AddDeviceDto {
  @IsString()
  deviceId: string;

  @IsOptional()
  @IsString()
  deviceName?: string;

  @IsOptional()
  @IsString()
  simNumber?: string;
}

export class UpdateDeviceDto {
  @IsOptional()
  @IsString()
  deviceName?: string;

  @IsOptional()
  @IsString()
  deviceIcon?: string;

  @IsOptional()
  @IsString()
  simNumber?: string;

  @IsOptional()
  @IsString()
  iccid?: string;
}

export class ActivateDeviceDto {
  @IsString()
  deviceId: string;

  @IsOptional()
  @IsString()
  simNumber?: string;

  @IsOptional()
  @IsString()
  iccid?: string;
}
